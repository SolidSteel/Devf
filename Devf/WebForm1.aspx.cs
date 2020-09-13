using Ext.Net;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Xsl;

namespace Devf
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Save_Contador(object sender, EventArgs e)
        {
            DataClasses1DataContext contador = new DataClasses1DataContext();

            TContadoresAgua tcounter = new TContadoresAgua();

            try
            {
                tcounter.SerialN = (int)txtSerial.Number;
                tcounter.Marca = txtMarca.Text;
                tcounter.Modelo = txtModelo.Text;

                #region ADD ID VALUE
                var query = (from c in contador.TContadoresAgua
                             select c);

                List<TContadoresAgua> listaValores = query.ToList<TContadoresAgua>();
                var maxID = 0;

                if (listaValores.Count != 0)
                {
                    maxID = listaValores.Max(x => x.Id);
                    tcounter.Id = maxID++;
                    tcounter.Id = maxID++;
                }
                else
                {
                    maxID = 1;

                }
                #endregion


                #region check Serial
                var querydupli = (from c in contador.TContadoresAgua where c.SerialN == txtSerial.Number select c);
                List<TContadoresAgua> listaValoresdupli = querydupli.ToList<TContadoresAgua>();
                #endregion


                if (listaValoresdupli.Count == 0)
                {
                    var result = contador.GetTable<TContadoresAgua>(); // get table

                    result.InsertOnSubmit(tcounter);
                    contador.SubmitChanges();
                    // Response.Write("Saved Successfully...");

                    Store1.DataBind();
                    X.Msg.Notify("Line Saved Correctly At:", DateTime.Now.ToLongTimeString()).Show();
                    FormPanel1.Reset();


                }
                else
                {
                    X.Msg.Notify("Error Saving", "Serial Number Already exists!").Show();
                }



            }
            catch (Exception ex)
            {
                throw new Exception();

            }







        }

        public void Save_Contador_EM(object sender, EventArgs e)
        {
            DataClasses1DataContext contador = new DataClasses1DataContext();

            TContadoresLuz tcounter = new TContadoresLuz();

            try
            {
                tcounter.SerialNumber = (int)txtSerialEM.Number;
                tcounter.Marca = txtMarcaEM.Text;
                tcounter.Modelo = txtModeloEM.Text;

                #region ADD ID VALUE
                var query = (from c in contador.TContadoresLuz
                             select c);

                List<TContadoresLuz> listaValores = query.ToList<TContadoresLuz>();
                var maxID = 0;

                if (listaValores.Count != 0)
                {
                    maxID = listaValores.Max(x => x.Id);
                    tcounter.Id = maxID++;
                    tcounter.Id = maxID++;
                }
                else
                {
                    maxID = 1;

                }

                #endregion

                #region check Serial

                var querydupli = (from c in contador.TContadoresLuz where c.SerialNumber == txtSerial.Number select c);
                List<TContadoresLuz> listaValoresdupli = querydupli.ToList<TContadoresLuz>();

                #endregion

                if (listaValoresdupli.Count == 0)
                {
                    var result = contador.GetTable<TContadoresLuz>(); // get table

                    result.InsertOnSubmit(tcounter);
                    contador.SubmitChanges();
                    // Response.Write("Saved Successfully...");

                    Store2.DataBind();
                    X.Msg.Notify("Line Saved Correctly At:", DateTime.Now.ToLongTimeString()).Show();
                    FormPanel2.Reset();


                }
                else
                {
                    X.Msg.Notify("Error Saving", "Serial Number Already exists!").Show();
                }



            }
            catch (Exception ex)
            {
                throw new Exception();

            }







        }

        public void Save_GW(object sender, EventArgs e)
        {
            DataClasses1DataContext contador = new DataClasses1DataContext();

            TGateways tGateway = new TGateways();

            try
            {
                tGateway.SerialNumber = (int)txtSerialGW.Number;
                tGateway.Marca = txtMarcaGW.Text;
                tGateway.Modelo = txtModeloGW.Text;
                tGateway.IP = txtIPGW.Text;
                tGateway.Puerto = txtPuertoGW.Text;

                #region ADD ID VALUE
                var query = (from c in contador.TGateways
                             select c);

                List<TGateways> listaValores = query.ToList<TGateways>();
                var maxID = 0;

                if (listaValores.Count != 0)
                {
                    maxID = listaValores.Max(x => x.Id);
                    tGateway.Id = maxID++;
                    tGateway.Id = maxID++;
                }
                else
                {
                    maxID = 1;

                }

                #endregion

                #region check Serial

                var querydupli = (from c in contador.TGateways where c.SerialNumber == txtSerialGW.Number select c);
                List<TGateways> listaValoresdupli = querydupli.ToList<TGateways>();

                #endregion

                if (listaValoresdupli.Count == 0)
                {
                    var result = contador.GetTable<TGateways>(); // get table

                    result.InsertOnSubmit(tGateway);
                    contador.SubmitChanges();
                    // Response.Write("Saved Successfully...");

                    Store3.DataBind();
                    X.Msg.Notify("Line Saved Correctly At:", DateTime.Now.ToLongTimeString()).Show();
                    FormPanel3.Reset();
                }
                else
                {
                    X.Msg.Notify("Error Saving", "Serial Number Already exists!").Show();
                }



            }
            catch (Exception ex)
            {
                throw new Exception();

            }







        }


    }
}