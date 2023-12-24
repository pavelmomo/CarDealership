using System.ComponentModel;

namespace Domain.Enums
{
    public enum BodyType
    {
        [Description("седан")]
        sedan = 0,
        [Description("хетчбек")]
        hatchback = 1,
        [Description("универсал")]
        wagon = 2,
        [Description("лифтбек")]
        liftback = 3,
        [Description("купе")]
        coupe = 4,
        [Description("кроссовер")]
        crossover = 5,
        [Description("внедорожник")]
        suv = 6,
        [Description("минивен")]
        minivan = 7
    }

}