<div id="scorebored" background-image="Images/leaderboard.jpg" height="500px" width="800px">
<img id="scoreboredimg" src="Images/leaderboard.jpg" height="500px" width="800px"/>
<asp:GridView Font-Size="Small" ID="GridView1" runat="server" DataSourceID="SqlDataSource4"
            DataKeyNames="id" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" CellPadding="4" AutoGenerateColumns="False" AutoGenerateEditButton="True" Width="600px" BackColor="Black" BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" HorizontalAlign="Left" EnableViewState="True">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="First" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="Last" />
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
</center>
</div>
 
 
 
<asp:SqlDataSource ID="SqlDataSource4" runat="server"
        ConnectionString="<%$ ConnectionStrings:SQLwww %>"
        SelectCommand="SELECT * from Users"
        UpdateCommand="UPDATE Users
                SET First_Name = @FirstName, Last_Name = @LastName, Score = @Score Where id = @id"
        InsertCommand="INSERT INTO [Users]
                ([FirstName], [LastName], [Score])
                VALUES (@FirstName, @LastName, @Score)">
       
        <InsertParameters>
            <asp:formparameter  Name="FirstName" formfield="First" Type="String" />
            <asp:formparameter  Name="LastName" formfield="Last" Type="String" />
            <asp:formparameter  Name="Score" formfield="Score" Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="id"/>
        </DeleteParameters>
 
    </asp:SqlDataSource>