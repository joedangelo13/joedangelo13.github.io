<%@ Page Title="Menu" Language="VB" AutoEventWireup="false" Debug="true"%>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="Style/style.css">
<title>AddPokemon</title>
<script src="JS/jquery-1.11.1.min.js"></script>
<script>
function BrowseImages(){
	
	
	
}





</script>
</head>

<body>
<script runat="server">
    Private Sub submit(ByVal Source As Object, ByVal e As EventArgs)
        SqlDataSource1.Insert()
        DexNumber.Text = " "
        PokemonName.Text = " "
        Type1.Text = " "
        Type2.Text = " "
		Height.Text = " "
        Weight.Text = " "
		PokemonDescription.Text= " "
		PokemonImage.Text= " "
		PokemonSound.Text= " "
	
    End Sub
</script>

<form id="form1" runat="server">
<div id="container">

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    	ConnectionString="<%$ ConnectionStrings:SQLwww %>"
        SelectCommand="select * from pokemon"
        UpdateCommand="UPDATE pokemon 
                SET DexNumber = @DexNumber, PokemonName = @PokemonName, Type1 = @Type1, Type2 = @Type2, Height = @Height, Weight = @Weight, PokemonDescription = @PokemonDescription, PokemonImage = @PokemonImage, PokemonSound = @PokemonSound
                 Where id = @id"
        InsertCommand="INSERT INTO [pokemon] 
                ([DexNumber], [PokemonName], [Type1],[Type2], [Height], [Weight], [PokemonDescription], [PokemonImage], [PokemonSound]) 
                VALUES (@DexNumber, @PokemonName, @Type1, @Type2, @Height, @Weight, @PokemonDescription, @PokemonImage, @PokemonSound)"
        DeleteCommand="DELETE From pokemon Where id = @id">
	
        <InsertParameters>
            <asp:formparameter  Name="DexNumber" formfield="DexNumber" Type="String" />
            <asp:formparameter  Name="PokemonName" formfield="PokemonName" Type="String" />
            <asp:formparameter  Name="Type1" formfield="Type1" Type="String" />
            <asp:formparameter  Name="Type2" formfield="Type2" Type="String" />
            <asp:formparameter  Name="Height" formfield="Height" Type="String" />
            <asp:formparameter  Name="Weight" formfield="Weight" Type="String" />
            <asp:formparameter  Name="PokemonDescription" formfield="PokemonDescription" Type="String" />
            <asp:formparameter  Name="PokemonImage" formfield="PokemonImage" Type="String" />
			<asp:formparameter  Name="PokemonSound" formfield="PokemonSound" Type="String" />

        </InsertParameters>

        <DeleteParameters>
            <asp:Parameter Name="id"/>
        </DeleteParameters>

        

    </asp:SqlDataSource>
<asp:GridView Font-Size="Small" ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
            DataKeyNames="id" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" CellPadding="4" AutoGenerateColumns="False" AutoGenerateEditButton="True" Width="600px" BackColor="Black" BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" HorizontalAlign="Left" EnableViewState="True">

            <Columns>
                <asp:BoundField DataField="DexNumber" HeaderText="DexNumber" SortExpression="DexNumber" />
                <asp:BoundField DataField="PokemonName" HeaderText="Pokemon Name" SortExpression="PokemonName" />
                <asp:BoundField DataField="Type1" HeaderText="Type1" SortExpression="Type1" />
                <asp:BoundField DataField="Type2" HeaderText="Type2" SortExpression="Type2" />
                <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="PokemonSound" HeaderText="PokemonSound" SortExpression="PokemonSound" />
                <asp:BoundField DataField="PokemonImage" HeaderText="PokemonImage" SortExpression="PokemonImage" />
                <asp:BoundField DataField="PokemonDescription" HeaderText="PokemonDescription" SortExpression="PokemonDescription" />

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton Runat="server" 
                    OnClientClick="return confirm('Are you sure you?');" 
                    CommandName="Delete">Delete</asp:LinkButton>
                </ItemTemplate>
             </asp:TemplateField>

            </Columns>

            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>


</div>
<div id="divone" style="width:400px;">
<h2 id="Number">Number</h2>
<asp:TextBox id="DexNumber" runat="server" /><br>
<h2 id="Name">Name</h2>
<asp:TextBox id="PokemonName" runat="server" /><br>
<br>
<h2 id="Type1">Type 1</h2>
<asp:TextBox id="Type1" runat="server" /><br>
<h2 id="Type2">Type 2</h2>
<asp:TextBox id="Type2" runat="server" /><br>
<h2 id="Height">Height</h2>
<asp:TextBox id="Height" runat="server" /><br>
<h2 id="Weight">Weight</h2>
<asp:TextBox id="Weight" runat="server" /><br>
<h2 id="Description">Description</h2>
<asp:TextBox id="PokemonDescription" runat="server" />
<h2 id="Image">Image</h2>
<asp:TextBox id="PokemonImage" runat="server" /><br>
<h2 id="Sound">Sound</h2>
<asp:TextBox id="PokemonSound" runat="server" /><br>
<br></div>
<asp:Button OnClick="submit" Text="Submit" runat="server" />

</div>
</form>
</body>
</html>
