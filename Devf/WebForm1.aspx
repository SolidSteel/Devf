<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/WebForm1.aspx.cs" Inherits="Devf.WebForm1" %>

<%@ Import Namespace="System.Collections.Generic" %>

<%@ Import Namespace="System.Xml.Xsl" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Linq" %>



<!DOCTYPE html>



<script type="text/javascript">
    var ExportYap = function () {
        // Ext.net.Mask.show();
        //Ext.net.Mask.hide.defer(500);
    };
</script>

<html>
<head runat="server">
    <title>GridPanel with LinqDataSource - Ext.NET Examples</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />

    <style>
        .x-grid-cell-fullName .x-grid-cell-inner {
            font-family: tahoma, verdana;
            display: block;
            font-weight: normal;
            font-style: normal;
            color: #385F95;
            white-space: normal;
        }

        .x-grid-rowbody div {
            margin: 2px 5px 20px 5px !important;
            width: 99%;
            color: Gray;
        }

        .x-grid-row-expanded td.x-grid-cell {
            border-bottom-width: 0px;
        }
    </style>

    <script>
        var fullName = function (value, metadata, record, rowIndex, colIndex, store) {
            return "<b>" + record.data.LastName + " " + record.data.FirstName + "</b>";
        };





    </script>



</head>
<body>
    <ext:Hidden ID="Hidden1" runat="server" />
    <form runat="server">
        <ext:ResourceManager runat="server" />

        <asp:LinqDataSource
            ID="LinqDataSource1"
            runat="server"
            ContextTypeName="Devf.DataClasses1DataContext"
            Select="new (
                         SerialN,
                         Marca,
                         Modelo)"
            TableName="TContadoresAgua" />


        <asp:LinqDataSource
            ID="LinqDataSource2"
            runat="server"
            ContextTypeName="Devf.DataClasses1DataContext"
            Select="new (
                         SerialNumber,
                         Marca,
                         Modelo)"
            TableName="TContadoresLuz" />


        <asp:LinqDataSource
            ID="LinqDataSource3"
            runat="server"
            ContextTypeName="Devf.DataClasses1DataContext"
            Select="new (
                         SerialNumber,
                         Marca,
                         Modelo,
                          IP,
                          Puerto)"
            TableName="TGateways" />


        <ext:Container runat="server" Layout="HBoxLayout">
            <Items>


                <ext:GridPanel
                    runat="server"
                    ID="GridPanel1"
                    Height="400"
                    Width="800"
                    Title="Water Meters"
                    Frame="true">
                    <Store>
                        <ext:Store ID="Store1"
                            runat="server" DataSourceID="LinqDataSource1">
                            <Model>
                                <ext:Model runat="server">
                                    <Fields>
                                        <ext:ModelField Name="SerialN" />
                                        <ext:ModelField Name="Marca" />
                                        <ext:ModelField Name="Modelo" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                    <ColumnModel runat="server">
                        <Columns>

                            <ext:Column runat="server" DataIndex="SerialN" Text="Serial Number" Width="150" />
                            <ext:Column runat="server" DataIndex="Marca" Text="Brand" Width="150" />
                            <ext:Column runat="server" DataIndex="Modelo" Text="Model" Width="100" />
                        </Columns>
                    </ColumnModel>

                    <SelectionModel>
                        <ext:RowSelectionModel runat="server" Mode="Multi" />
                    </SelectionModel>

                </ext:GridPanel>

                <ext:Panel
                    runat="server"
                    Layout="Fit"
                    Width="600"
                    Height="250">
                    <Items>
                        <ext:FormPanel
                            ID="FormPanel1"
                            runat="server"
                            Title="Save Water Meter (all fields required)"
                            BodyPadding="5"
                            ButtonAlign="Right"
                            Layout="Column">
                            <Items>
                                <ext:Panel
                                    runat="server"
                                    Border="false"
                                    Header="false"
                                    ColumnWidth=".5"
                                    Layout="Form"
                                    LabelAlign="Top">
                                    <Defaults>
                                        <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                                        <ext:Parameter Name="MsgTarget" Value="side" />
                                    </Defaults>
                                    <Items>
                                        <ext:NumberField runat="server" ID="txtSerial" FieldLabel="Serial Number" AnchorHorizontal="92%" MaxLength="8" />
                                    </Items>
                                </ext:Panel>
                                <ext:Panel runat="server" Border="false" Layout="Form" ColumnWidth=".5" LabelAlign="Top">
                                    <Defaults>
                                        <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                        <ext:Parameter Name="MsgTarget" Value="side" />
                                    </Defaults>
                                    <Items>
                                        <ext:TextField runat="server" ID="txtMarca" FieldLabel="Brand" AnchorHorizontal="92%" />

                                        <ext:TextField runat="server" ID="txtModelo" FieldLabel="Model" AnchorHorizontal="92%" />
                                    </Items>
                                </ext:Panel>
                            </Items>
                            <BottomBar>
                                <ext:StatusBar runat="server" />
                            </BottomBar>
                            <Listeners>
                                <ValidityChange Handler="this.dockedItems.get(1).setStatus({
                                                     text : valid ? 'Form is valid' : 'Form is invalid',
                                                     iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                                 });
                                                 #{Button1}.setDisabled(!valid);" />
                            </Listeners>
                        </ext:FormPanel>
                    </Items>
                    <Buttons>
                        <ext:Button
                            ID="Button1"
                            runat="server"
                            Text="Save"
                            Disabled="true"
                            FormBind="true"
                            OnDirectClick="Save_Contador">
                        </ext:Button>
                    </Buttons>
                </ext:Panel>

            </Items>



        </ext:Container>


        <ext:Container runat="server" Layout="HBoxLayout">
            <Items>


                <ext:GridPanel
                    runat="server"
                    ID="GridPanel2"
                    Height="400"
                    Width="800"
                    Title="Electrity Meter"
                    Frame="true">
                    <Store>
                        <ext:Store ID="Store2"
                            runat="server" DataSourceID="LinqDataSource2">
                            <Model>
                                <ext:Model runat="server">
                                    <Fields>
                                        <ext:ModelField Name="SerialNumber" />
                                        <ext:ModelField Name="Marca" />
                                        <ext:ModelField Name="Modelo" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                    <ColumnModel runat="server">
                        <Columns>

                            <ext:Column runat="server" DataIndex="SerialNumber" Text="Serial Number" Width="150" />
                            <ext:Column runat="server" DataIndex="Marca" Text="Brand" Width="150" />
                            <ext:Column runat="server" DataIndex="Modelo" Text="Model" Width="100" />
                        </Columns>
                    </ColumnModel>

                    <SelectionModel>
                        <ext:RowSelectionModel runat="server" Mode="Multi" />
                    </SelectionModel>

                </ext:GridPanel>

                <ext:Panel
                    runat="server"
                    Layout="Fit"
                    Width="600"
                    Height="250">
                    <Items>
                        <ext:FormPanel
                            ID="FormPanel2"
                            runat="server"
                            Title="Save Electricity Meter (all fields required)"
                            BodyPadding="5"
                            ButtonAlign="Right"
                            Layout="Column">
                            <Items>
                                <ext:Panel
                                    runat="server"
                                    Border="false"
                                    Header="false"
                                    ColumnWidth=".5"
                                    Layout="Form"
                                    LabelAlign="Top">
                                    <Defaults>
                                        <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                                        <ext:Parameter Name="MsgTarget" Value="side" />
                                    </Defaults>
                                    <Items>
                                        <ext:NumberField runat="server" ID="txtSerialEM" FieldLabel="Serial Number" AnchorHorizontal="92%" MaxLength="8" />
                                    </Items>
                                </ext:Panel>
                                <ext:Panel runat="server" Border="false" Layout="Form" ColumnWidth=".5" LabelAlign="Top">
                                    <Defaults>
                                        <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                        <ext:Parameter Name="MsgTarget" Value="side" />
                                    </Defaults>
                                    <Items>
                                        <ext:TextField runat="server" ID="txtModeloEM" FieldLabel="Model" AnchorHorizontal="92%" />
                                        <ext:TextField runat="server" ID="txtMarcaEM" FieldLabel="Brand" AnchorHorizontal="92%" />

                                    </Items>
                                </ext:Panel>
                            </Items>
                            <BottomBar>
                                <ext:StatusBar runat="server" />
                            </BottomBar>
                            <Listeners>
                                <ValidityChange Handler="this.dockedItems.get(1).setStatus({
                                                     text : valid ? 'Form is valid' : 'Form is invalid',
                                                     iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                                 });
                                                 #{Button2}.setDisabled(!valid);" />
                            </Listeners>
                        </ext:FormPanel>
                    </Items>
                    <Buttons>
                        <ext:Button
                            ID="Button2"
                            runat="server"
                            Text="Save"
                            Disabled="true"
                            FormBind="true"
                            OnDirectClick="Save_Contador_EM">
                        </ext:Button>
                    </Buttons>
                </ext:Panel>

            </Items>



        </ext:Container>


                <ext:Container runat="server" Layout="HBoxLayout">
            <Items>


                <ext:GridPanel
                    runat="server"
                    ID="GridPanel3"
                    Height="400"
                    Width="800"
                    Title="Gateways"
                    Frame="true">
                    <Store>
                        <ext:Store ID="Store3"
                            runat="server" DataSourceID="LinqDataSource3">
                            <Model>
                                <ext:Model runat="server">
                                    <Fields>
                                        <ext:ModelField Name="SerialNumber" />
                                        <ext:ModelField Name="Marca" />
                                        <ext:ModelField Name="Modelo" />
                                        <ext:ModelField Name="IP" />
                                        <ext:ModelField Name="Puerto" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                    <ColumnModel runat="server">
                        <Columns>

                            <ext:Column runat="server" DataIndex="SerialNumber" Text="Serial Number" Width="150" />
                            <ext:Column runat="server" DataIndex="Marca" Text="Brand" Width="150" />
                            <ext:Column runat="server" DataIndex="Modelo" Text="Model" Width="100" />
                            <ext:Column runat="server" DataIndex="IP" Text="IP" Width="100" />
                            <ext:Column runat="server" DataIndex="Puerto" Text="Port" Width="100" />
                        </Columns>
                    </ColumnModel>

                    <SelectionModel>
                        <ext:RowSelectionModel runat="server" Mode="Multi" />
                    </SelectionModel>

                </ext:GridPanel>

                <ext:Panel
                    runat="server"
                    Layout="Fit"
                    Width="600"
                    Height="250">
                    <Items>
                        <ext:FormPanel
                            ID="FormPanel3"
                            runat="server"
                            Title="Save Gateway "
                            BodyPadding="5"
                            ButtonAlign="Right"
                            Layout="Column">
                            <Items>
                                <ext:Panel
                                    runat="server"
                                    Border="false"
                                    Header="false"
                                    ColumnWidth=".5"
                                    Layout="Form"
                                    LabelAlign="Top">
                                    <Defaults>
                                        <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                                        <ext:Parameter Name="MsgTarget" Value="side" />
                                    </Defaults>
                                    <Items>
                                        <ext:NumberField runat="server" ID="txtSerialGW" FieldLabel="Serial Number" AnchorHorizontal="92%" MaxLength="8" />
                                        <ext:TextField runat="server" ID="txtIPGW" FieldLabel="IP" AnchorHorizontal="92%" />

                                    </Items>
                                </ext:Panel>
                                <ext:Panel runat="server" Border="false" Layout="Form" ColumnWidth=".5" LabelAlign="Top">
                                    <Defaults>
                                        <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                        <ext:Parameter Name="MsgTarget" Value="side" />
                                    </Defaults>
                                    <Items>
                                        <ext:TextField runat="server" ID="txtModeloGW" FieldLabel="Model" AnchorHorizontal="92%" />
                                        <ext:TextField runat="server" ID="txtMarcaGW" FieldLabel="Brand" AnchorHorizontal="92%" />
                                        <ext:TextField runat="server" ID="txtPuertoGW" FieldLabel="Brand" AnchorHorizontal="92%" />

                                    </Items>
                                </ext:Panel>
                            </Items>
                            <BottomBar>
                                <ext:StatusBar runat="server" />
                            </BottomBar>
                            <Listeners>
                                <ValidityChange Handler="this.dockedItems.get(1).setStatus({
                                                     text : valid ? 'Form is valid' : 'Form is invalid',
                                                     iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                                 });
                                                 #{Button3}.setDisabled(!valid);" />
                            </Listeners>
                        </ext:FormPanel>
                    </Items>
                    <Buttons>
                        <ext:Button
                            ID="Button3"
                            runat="server"
                            Text="Save"
                            Disabled="true"
                            FormBind="true"
                            OnDirectClick="Save_GW">
                        </ext:Button>
                    </Buttons>
                </ext:Panel>

            </Items>



        </ext:Container>


    </form>
</body>
</html>
