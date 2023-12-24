using System;
using System.Data.Entity;
using System.Linq;
using Domain.Entity;

namespace DAL.EF
{
    public class DealershipDbContext : DbContext
    {
        
        public DealershipDbContext() : base("name=car_dealership")
        {
            
            Database.SetInitializer(new DbInitializer());

        }

        
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Model> Models { get; set; }
        public virtual DbSet<Car> Cars { get; set; }
        public virtual DbSet<Agent> Agents { get; set; }
        public virtual DbSet<Deal> Deals { get; set; }
        public virtual DbSet<Accessory> Accessories { get; set; }
        public virtual DbSet<AccessoryCart> AccessoryCarts { get; set; }
        public virtual DbSet<ConfigurationOption> ConfigurationOptions { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("public");
            modelBuilder.Properties().Configure(c =>
            {
                var name = c.ClrPropertyInfo.Name;
                var newName = char.ToLower(name[0]) + name.Substring(1);
                c.HasColumnName(newName);
            });

            #region Brand

            modelBuilder.Entity<Brand>().ToTable("brand");
            modelBuilder.Entity<Brand>()
                .HasMany(e => e.Models)
                .WithRequired(e => e.Brand)
                .WillCascadeOnDelete(false);
            modelBuilder.Entity<Brand>().Property(e => e.Name).IsRequired();
            modelBuilder.Entity<Brand>().Property(e => e.Country).IsOptional();

            #endregion

            #region Model

            modelBuilder.Entity<Model>().ToTable("model");
            modelBuilder.Entity<Model>()
                .HasMany(e => e.Cars)
                .WithRequired(e => e.Model)
                .WillCascadeOnDelete(false);
            modelBuilder.Entity<Model>().Property(e => e.Name).IsRequired();

            #endregion

            #region Car

            modelBuilder.Entity<Car>().ToTable("car");
            modelBuilder.Entity<Car>().Property( e => e.Color).IsRequired();
            modelBuilder.Entity<Car>().Property(e => e.Description).IsOptional();
            modelBuilder.Entity<Car>().Property(e => e.Vin).IsRequired();
            modelBuilder.Entity<Car>().Property(e => e.RegistrationNumber).IsRequired();
            modelBuilder.Entity<Car>().Property(e => e.BodyNumber).IsRequired();
            modelBuilder.Entity<Car>().Property(e => e.ImagePath).IsRequired();
            modelBuilder.Entity<Car>().Property(e => e.EngineNumber).IsRequired();
            modelBuilder.Entity<Car>().Property(e => e.Pts).IsRequired();
            modelBuilder.Entity<Car>().Property(e => e.Sts).IsRequired();
            
            modelBuilder.Entity<Car>()
                .HasMany(e => e.Deals)
                .WithRequired(e => e.Car)
                .WillCascadeOnDelete(false);

            #endregion

            #region Agent

            modelBuilder.Entity<Agent>().ToTable("agent");
            modelBuilder.Entity<Agent>().Property(e => e.Fio).IsRequired();
            modelBuilder.Entity<Agent>().HasMany(e => e.Deals).WithRequired(e => e.Agent).WillCascadeOnDelete(false);

            #endregion

            #region Configuration Option

            modelBuilder.Entity<ConfigurationOption>().ToTable("configuration_option");
            modelBuilder.Entity<ConfigurationOption>()
                .HasMany(e => e.Cars)
                .WithMany(e => e.ConfigurationOptions)
                .Map(e =>
                {
                    e.ToTable("_cars_options");
                    e.MapLeftKey("optionId");
                    e.MapRightKey("carId");

                });
            modelBuilder.Entity<ConfigurationOption>().Property(e => e.Name).IsRequired();
            #endregion

            #region Deal

            modelBuilder.Entity<Deal>().ToTable("deal");
            modelBuilder.Entity<Deal>()
                .HasMany(e => e.AccessoryCarts)
                .WithRequired(e => e.Deal).WillCascadeOnDelete(true);
            modelBuilder.Entity<Deal>().Property(e => e.TotalPrice).IsRequired();
            modelBuilder.Entity<Deal>().Property(e => e.CustomerFIO).IsRequired();
            modelBuilder.Entity<Deal>().Property(e => e.CustomerPassport).IsRequired();
            modelBuilder.Entity<Deal>().Property(e => e.CustomerDateOfBirth).IsRequired();
            modelBuilder.Entity<Deal>().Property(e => e.CustomerPlaceOfLiving).IsRequired();
            modelBuilder.Entity<Deal>().Property(e => e.CustomerTelephone).IsRequired();


            #endregion

            #region Accessory

            modelBuilder.Entity<Accessory>().ToTable("accessory");
            modelBuilder.Entity<Accessory>()
                .HasMany(e => e.AccessoryCart)
                .WithRequired(e => e.Accessory)
                .WillCascadeOnDelete(false);
            modelBuilder.Entity<Accessory>().Property(e => e.Name).IsRequired();
            modelBuilder.Entity<Accessory>().Property(e => e.Count).IsRequired();

            #endregion

            #region Accessory Cart

            modelBuilder.Entity<AccessoryCart>().ToTable("accessory_cart");

            #endregion

            
        }
    }

   
}