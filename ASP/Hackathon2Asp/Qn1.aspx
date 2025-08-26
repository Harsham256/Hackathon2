<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qn1.aspx.cs" Inherits="Hackathon2Asp.Qn1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Word Dictionary App</title>
    <style>
        body {
            background-color: #121212;
            color: #e6e6e6;
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h2 { color: #4da6ff; }
        .section {
            border: 1px solid #4da6ff;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
        }
        table {
            border-collapse: collapse;
            margin-top: 10px;
            width: 50%;
        }
        th, td {
            border: 1px solid #4da6ff;
            padding: 8px;
            text-align: left;
        }
        th { background-color: #1e1e2e; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- 🔹 Search Section -->
        <div class="section">
            <h2>Search Word</h2>
            <asp:TextBox ID="txtSearchWord" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            <!-- Search Result Table -->
            <asp:Panel ID="pnlSearchResult" runat="server" Visible="false">
                <table>
                    <tr>
                        <th>Word</th>
                        <th>Translation</th>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lblResultWord" runat="server"></asp:Label></td>
                        <td><asp:Label ID="lblResultTranslation" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </asp:Panel>
        </div>

        <!-- 🔹 Add / Update Section -->
        <div class="section">
            <h2>Add or Update Word</h2>
            Word: <asp:TextBox ID="txtNewWord" runat="server"></asp:TextBox><br /><br />
            Translation: <asp:TextBox ID="txtNewTranslation" runat="server"></asp:TextBox><br /><br />
            <asp:Button ID="btnAddOrUpdate" runat="server" Text="Save Word" OnClick="btnAddOrUpdate_Click" />
            <br /><br />
            <asp:Label ID="lblAddMessage" runat="server" ForeColor="LightGreen"></asp:Label>
        </div>

        <!-- 🔹 My Words Section -->
        <div class="section">
            <h2>My Words</h2>
            <asp:GridView ID="gvWords" runat="server" AutoGenerateColumns="false" GridLines="Both" BorderColor="#4da6ff" ForeColor="#e6e6e6">
                <Columns>
                    <asp:BoundField DataField="Key" HeaderText="Word" />
                    <asp:BoundField DataField="Value" HeaderText="Translation" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnRefresh" runat="server" Text="Refresh List" OnClick="btnRefresh_Click" />
        </div>

    </form>
</body>
</html>
<%--  --%>