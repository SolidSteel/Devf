<%@ Page Language="C#" %> CodeFile="class.cs" Inherits="class1"

<!DOCTYPE html>
<script runat="server">

    protected void Unnamed_Click(object sender, EventArgs e)
    {

    }
</script>


<html>
<head runat="server">
    <title>GridPanel with LinqDataSource - Ext.NET Examples</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />

    <style>
        .x-grid-cell-fullName .x-grid-cell-inner {
            font-family : tahoma, verdana;
            display     : block;
            font-weight : normal;
            font-style  : normal;
            color       : #385F95;
            white-space : normal;
        }

        .x-grid-rowbody div {
            margin : 2px 5px 20px 5px !important;
            width  : 99%;
            color  : Gray;
        }

        .x-grid-row-expanded td.x-grid-cell{
            border-bottom-width:0px;
        }
    </style>

    <script>
        var fullName = function (value, metadata, record, rowIndex, colIndex, store) {
           return "<b>" + record.data.LastName + " " + record.data.FirstName + "</b>";
        };
    </script>
</head>
<body>
    <form runat="server">
        <ext:ResourceManager runat="server" />

        <asp:LinqDataSource
            ID="LinqDataSource1"
            runat="server"
            ContextTypeName="Devf.DataClasses1DataContext"
            Select="new (Id,
                         SerialN,
                         Marca,
                         Modelo)"
            TableName="TContadoresAgua"
            />

        <ext:GridPanel
            runat="server"
            ID="GridPanel1"
            Height="400"
            Width="800"
            Title="Water Counters"
            Frame="true">
            <Store>
                <ext:Store runat="server" DataSourceID="LinqDataSource1">
                    <Model>
                        <ext:Model runat="server">
                            <Fields>
                                <ext:ModelField Name="Id" />
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
                   
                    <ext:Column runat="server" DataIndex="Id" Text="ID"  Width="150" />
                    <ext:Column runat="server" DataIndex="SerialN" Text="Serial Number"  Width="150" />
                    <ext:Column runat="server" DataIndex="Marca" Text="Brand" Width="150" />
                    <ext:Column runat="server" DataIndex="Modelo" Text="Model" Width="100" />
                </Columns>
            </ColumnModel>
       
            <SelectionModel>
                <ext:RowSelectionModel runat="server" Mode="Multi" />
            </SelectionModel>
    
        </ext:GridPanel>
        <ext:FormPanel
                runat="server"
                Title="Add Data"
                Frame="true"
                Height="400"
                Width="400"
                Border="false"
                BodyPadding="10"
                DefaultAnchor="100%">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelWidth="100"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter Name="margin" Value="0 0 10 0" Mode="Value" />
                </Defaults>
                <Items>
<%--                    <ext:FieldContainer
                        runat="server"
                        FieldLabel="Your Name"
                        LabelStyle="font-weight:bold;padding:0;"
                        Layout="HBox">
                        <FieldDefaults LabelAlign="Top" />
                        <Items>
                            <ext:TextField
                                runat="server"
                                Name="firstName"
                                Flex="1"
                                FieldLabel="First"
                                AllowBlank="false" />

                            <ext:TextField
                                runat="server"
                                Width="30"
                                Name="middleInitial"
                                FieldLabel="MI"
                                MarginSpec="0 0 0 5" />

                            <ext:TextField
                                runat="server"
                                Flex="2"
                                Name="lastName"
                                FieldLabel="Last"
                                AllowBlank="false"
                                MarginSpec="0 0 0 5" />
                        </Items>
                    </ext:FieldContainer>--%>

                    <ext:TextField
                        ID="txtSerial"
                        runat="server"
                        FieldLabel="Serial"
                        
                        AllowBlank="false" />

                    <ext:TextField
                        ID="txtMarca"
                        
                        runat="server" FieldLabel="Brand" AllowBlank="false" />

                    
                    <ext:TextField
                        ID="txtModelo"
                        
                        runat="server" FieldLabel="Model" AllowBlank="false" />


                </Items>
                <Buttons>
                    <ext:Button runat="server" Text="Cancel" OnClick="Unnamed_Click"/>
                    <ext:Button runat="server" Text="Send" />
                </Buttons>
            </ext:FormPanel>
    </form>
</body>
</html>