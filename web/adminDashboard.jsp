<%@ page import="java.util.List, UserLogin.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Admin Dashboard</title>
    <!-- FONTS LINKS -->
    <link rel="stylesheet" href="./Fonts/times/stylesheet.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="./Fonts/cascadia/stylesheet.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="./Fonts/hormony/stylesheet.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="./Fonts/Sora/stylesheet.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="./Fonts/p22 mackinac/stylesheet.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="./CSS/universalFontStyle.css">
    <!-- CSS LINKS -->
    <link rel="stylesheet" href="CSS/adminStyle.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
</head>
<%
    // Retrieve donations list and pagination attributes from the request
    List<Member> members = (List<Member>) request.getAttribute("members");
    int newPage = (int) request.getAttribute("page");
    int entriesPerPage = (int) request.getAttribute("entriesPerPage");
    String username = (String)request.getAttribute("username");
    int memberCount = (int)request.getAttribute("memberCount");
    int totalAmount = (int)request.getAttribute("totalAmount");
    int subCount = (int)request.getAttribute("subCount");
%>
<body>
   <input type="checkbox" checked id="menu-toggle">
    <div class="sidebar">
        <div class="side-header">
            <h3>HFI</h3>
        </div>
        
        <div class="side-content">
            <div class="profile">
                <div class="profile-img bg-img" style="background-image: url(img/1.jpeg)"></div>
                <h4><%=username%></h4>
                <small>ngo admin</small>
            </div>

            <div class="side-menu">
                <ul>
                    <li>
                        <a href="Dashboard" class="active">
                             <span class="las la-tasks"></span>
                             <small>Dashboard</small>
                         </a>
                     </li>
                    <li>
                      <a href="Profile">
                            <span class="las la-user-alt"></span>
                            <small class ="ProfileProjectGotoHome">Profile</small> 
                            </a>
                    </li>
                  
                    <li>
                       <a href="">
                            <span class="las la-clipboard-list"></span>
                            <a href="Donations"><small class ="ProfileProjectGotoHome">Donations</small></a>
                        </a>
                    </li>
                   
                    

                    <li>
                        <a href="" >
                             <span class="las la-home"></span>
                             <a href="Home.jsp"><small class ="ProfileProjectGotoHome">Go To Home</small></a>
                         </a>
                     </li>

                </ul>
            </div>
        </div>
    </div>
    
    <div class="main-content">
        
        <header>
            <div class="header-content">
                <label for="menu-toggle">
                    <span class="las la-bars"></span>
                </label>
                
                <div class="header-menu">
                   
                    
                    <div class="user"c>
                        <div class="bg-img" style="background-image: url(img/1.jpeg)"></div>
                        
                        <span class="las la-power-off"></span>
                        <a href="Logout"><span > Logout</span></a>
                    </div>
                </div>
            </div>
        </header>
        
        
        <main>
            
            <div class="page-header">
                <h1>Dashboard</h1>
                <small>Welcome NGO Admin To Your Dashboard</small>
            </div>
            
            <div class="page-content">
            
                <div class="analytics">

                    <div class="card">
                        <div class="card-head">
                            <h2><%=totalAmount%>RS</h2>
                            <span class="las la-user-friends"></span>
                        </div>
                        <div class="card-progress">
                            <small>Total Donations</small>
                            <div class="card-indicator">
                                <div class="indicator one" style="width: 60%"></div>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-head">
                            <h2><%=memberCount%></h2>
                            <span class="las la-eye"></span>
                        </div>
                        <div class="card-progress">
                            <small>Total Members</small>
                            <div class="card-indicator">
                                <div class="indicator two" style="width: 80%"></div>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-head">
                            <h2>4</h2>
                            <span class="las la-shopping-cart"></span>
                        </div>
                        <div class="card-progress">
                            <small>Currently Active Works</small>
                            <div class="card-indicator">
                                <div class="indicator three" style="width: 65%"></div>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-head">
                            <h2><%=subCount%></h2>
                            <span class="las la-envelope"></span>
                        </div>
                        <div class="card-progress">
                            <small>Subscribers</small>
                            <div class="card-indicator">
                                <div class="indicator four" style="width: 90%"></div>
                            </div>
                        </div>
                    </div>

                </div>

                    <div>
                        <table width="100%">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th><span class="las la-sort"></span> Username</th>
                                    <th><span class="las la-sort"></span> Name</th>
                                    <th><span class="las la-sort"></span> Phone</th>
                                    <th><span class="las la-sort"></span> Email</th>
                                    <th><span class="las la-sort"></span> Amin Acess</th>
                                    <th><span class="las la-sort"></span> View & Delete</th>
                                </tr>
                            </thead>
                            <%
                                int i = (int) request.getAttribute("offset") + 1;
                                for (Member member : members) {
                            %>
                                <tr>
                                    <td scope="row"><%= i++ %></td>
                                    <td><h4>@<%= member.getUsername() %></h4></td>
                                    <td><%= member.getFirstname() + " " + member.getLastname() %></td>
                                    <td><%= member.getPhone() %></td>
                                    <td><%= member.getEmail() %></td>
                                    <td><%= member.getAdmin() %></td>
                                    <td>
                                        <div class="actions">
                                            <a onclick="viewButton(this)"><span class="las la-eye"></span></a>
                            <%
                                            if (!session.getAttribute("username").equals(member.getUsername())) {
                            %>
                                            <a onclick="delButton(this)"><span class="las la-trash-alt"></span></a>
                            <%
                                            } else {
                            %>
                                            &nbsp;
                            <%
                                            }
                            %>
                                        </div>
                                    </td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                        </table>
                        <%
                                if (newPage > 1) {
                                    out.println("<a href='Donations?page=" + (newPage - 1) + "' class='btn btn-primary col-sm mx-3' style='max-width: fit-content;'>Prev</a>");
                                }
                                if (members.size() == entriesPerPage) {
                                    out.println("<a href='Donations?page=" + (newPage + 1) + "' class='btn btn-primary col-sm mx-3' style='max-width: fit-content;'>Next</a>");
                                }
                            %> 
                    </div>
                </div>
            </div>
            <!-- Hidden form to store the data for submission -->
            <form id="hiddenForm" method="post" style="display: none;">
                <input type="hidden" id="hiddenField" name="username">
            </form>
        </main>
    </div>
    <!-- Script to view or delete admin -->
    <script>
        function viewButton(button) {
            // Get the data from the second column of the first row
            var rowData = button.parentNode.parentNode.parentNode.firstElementChild.nextElementSibling.innerText;

            rowData = rowData.replace('@', '');

            // Populate the hidden form field
            document.getElementById('hiddenField').value = rowData;

            // Submit the form
            document.getElementById('hiddenForm').action = 'ViewProfile';
            document.getElementById('hiddenForm').submit();
        }
        function delButton(button) {
            // Get the data from the second column of the first row
            var rowData = button.parentNode.parentNode.parentNode.firstElementChild.nextElementSibling.innerText;
            

            rowData = rowData.replace('@', '');

            // Populate the hidden form field
            document.getElementById('hiddenField').value = rowData;

            // Submit the form
            document.getElementById('hiddenForm').action = 'DeleteProfile';
            document.getElementById('hiddenForm').submit();
        }
    </script>
</body>
</html>