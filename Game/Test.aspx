<%@ Page Title="Menu" Language="VB" AutoEventWireup="false" Debug="true"%>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="Style/style.css">
<title>Scoreboard</title>
<script src="JS/jquery-1.11.1.min.js"></script>
<script>
function BrowseImages(){
	
	
	
}





</script>
</head>

<body>
<script runat="server">
    Private Sub submit(ByVal Source As Object, ByVal e As EventArgs)
        SqlDataSource4.Insert()
        FName.Text = " "
        LTName.Text = " "
        Score.Text = " "
        
	
    End Sub
</script>

<form id="form1" runat="server">
<div id="container">

<asp:SqlDataSource ID="SqlDataSource4" runat="server"
        ConnectionString="<%$ ConnectionStrings:SQLwww %>"
        SelectCommand="SELECT * from Users"
        UpdateCommand="UPDATE Users
                SET First_Name = @FirstName, Last_Name = @LastName, Score = @Score Where id = @id"
        InsertCommand="INSERT INTO [Users]
                ([FirstName], [LastName], [Score])
                VALUES (@FirstName, @LastName, @Score)"
        DeleteCommand="DELETE From Users Where id = @id">
       
        <InsertParameters>
            <asp:formparameter  Name="FirstName" formfield="FName" Type="String" />
            <asp:formparameter  Name="LastName" formfield="LTName" Type="String" />
            <asp:formparameter  Name="Score" formfield="Score" Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="id"/>
        </DeleteParameters>
 
    </asp:SqlDataSource>
<asp:GridView Font-Size="Small" ID="GridView1" runat="server" DataSourceID="SqlDataSource4"
            DataKeyNames="id" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" CellPadding="4" AutoGenerateColumns="False" AutoGenerateEditButton="False" Width="600px" BackColor="Black" BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" HorizontalAlign="Left" EnableViewState="True">

            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
         
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
<h2 id="FN">FirstName</h2>
<asp:TextBox id="FName" runat="server" /><br>
<h2 id="LN">LastName</h2>
<asp:TextBox id="LTName" runat="server" /><br>
<br>
<h2 id="Score">Score</h2>
<asp:TextBox id="Score" runat="server"  readonly /><br>

<asp:Button OnClick="submit" Text="Submit" runat="server" />

</div>
</form>
</body>
</html>