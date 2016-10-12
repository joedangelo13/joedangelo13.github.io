<%@ Page Title="Menu" Language="VB" AutoEventWireup="false" Debug="true"%>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="Style/style.css">
<title>Comment</title>
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
        Idea.Text = " "
        Description.Text = " "
        Email.Text = " "
        Phone.Text = " "
		
	
    End Sub
</script>

<form id="form1" runat="server">
<div id="container">

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    	ConnectionString="<%$ ConnectionStrings:SQLwww %>"
        SelectCommand="select * from pokemonUser"
        UpdateCommand="UPDATE pokemonUser
                SET Idea = @Idea, Description = @Description, Email = @Email, Phone = @Phone
                 Where id = @id"
        InsertCommand="INSERT INTO [pokemonUser] 
                ([Idea], [Description], [Email],[Phone]) 
                VALUES (@Idea, @Description, @Email, @Phone)"
        DeleteCommand="DELETE From pokemonUser Where id = @id">
	
        <InsertParameters>
            <asp:formparameter  Name="Idea" formfield="Idea" Type="String" />
            <asp:formparameter  Name="Description" formfield="Description" Type="String" />
            <asp:formparameter  Name="Email" formfield="Email" Type="String" />
            <asp:formparameter  Name="Phone" formfield="Phone" Type="String" />
        </InsertParameters>

        <DeleteParameters>
            <asp:Parameter Name="id"/>
        </DeleteParameters>

        

    </asp:SqlDataSource>
<asp:GridView Font-Size="Small" ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
            DataKeyNames="id" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" CellPadding="4" AutoGenerateColumns="False" AutoGenerateEditButton="True" Width="600px" BackColor="Black" BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" HorizontalAlign="Left" EnableViewState="True">

            <Columns>
                <asp:BoundField DataField="Idea" HeaderText="Idea" SortExpression="Idea" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
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
<h2 id="Idea">Idea</h2>
<asp:TextBox id="Idea" runat="server" /><br>
<h2 id="Description">Description</h2>
<asp:TextBox id="Description" runat="server" /><br>
<br>
<h2 id="Email">Email</h2>
<asp:TextBox id="Email" runat="server" /><br>
<h2 id="Phone">Phone</h2>
<asp:TextBox id="Phone" runat="server" /><br>
</div>
<asp:Button OnClick="submit" Text="Submit" runat="server" />

</div>
</form>
</body>

