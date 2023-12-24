using Application.DTO;
using Application.Interfaces.Repository;
using Application.Interfaces.Service;
using Domain.Entity;
using iText.Forms;
using iText.Forms.Fields;
using iText.Kernel.Pdf;
using System;
using System.Collections.Generic;
using System.IO;



namespace BLL.Services
{
    public class DocumentService : IDocumentService
    {
        private Dictionary<string,string> formData = new Dictionary<string,string>();

        IDbRepository dbRepository;
        
        public DocumentService(IDbRepository dbRepository)
        {
            this.dbRepository = dbRepository;
            
        }

        public bool GenerateAndSavePdf(long dealId, string savePath)
        {
            Deal deal = dbRepository.Deals.GetOne(dealId);
            if (deal == null) { return false; }
            FillData(deal);
            string templatePath = Path.Combine(Environment.CurrentDirectory, "car_document_template.pdf");

            if (!System.IO.File.Exists(templatePath)) { return false; }

            var pdfDoc = new PdfDocument(new PdfReader(templatePath), new PdfWriter(savePath));
            if (pdfDoc ==  null) { return false; }
            PdfAcroForm docForm = PdfAcroForm.GetAcroForm(pdfDoc, false);
            if(docForm == null) { return false; }
            docForm.Put(PdfName.NeedAppearances, new PdfBoolean(true));
            IDictionary<string, PdfFormField> fields = docForm.GetFormFields();
            if (fields == null) { return false; }
            PdfFormField fieldToSet;
            foreach ( var field in formData)
            {
                fields.TryGetValue(field.Key, out fieldToSet);
                if (fieldToSet == null) { pdfDoc.Close(); return false; }
                fieldToSet.SetValue(field.Value);
                fieldToSet.SetReadOnly(true);
            }
            pdfDoc.Close();
            return true;
        }
        
        private void FillData(Deal deal)
        {
            formData.Clear();
            formData["fio1"] = formData["fio2"] = deal.CustomerFIO.ToString();
            formData["date"] = deal.Date.ToShortDateString();
            formData["pts"] = deal.Car.Pts;
            formData["sts"] = deal.Car.Sts;
            formData["brand_model"] = deal.Car.Model.Brand.Name + " " + deal.Car.Model.Name;
            formData["year_of_release"] = deal.Car.YearOfRelease.ToString();
            formData["vin"] = deal.Car.Vin;
            formData["body_number"] = deal.Car.BodyNumber;
            formData["engine_number"] = deal.Car.EngineNumber;
            formData["reg_number"] = deal.Car.RegistrationNumber;
            formData["color"] = deal.Car.Color;
            formData["price"] = deal.Car.Price.ToString();
            formData["customer_living_place"] = deal.CustomerPlaceOfLiving;
            formData["customer_date_of_birth"] = deal.CustomerDateOfBirth;
            formData["customer_passport"] = deal.CustomerPassport;
            formData["customer_phone_number"] = "+" + deal.CustomerTelephone.ToString();

        }
    }
}
