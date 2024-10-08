<%-- 
    Document   : manager-services-list
    Created on : Sep 20, 2024, 10:35:21 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Manager | Services List</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/services.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">

        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <%@ include file="dashboardleft.jsp" %>
        <main class="app-content">

            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="serviceslist"><b>Danh sách dịch vụ</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">

                            <div class="row mb-3 d-flex justify-content-between align-items-center">
                                <div class="d-flex">
                                    <div class="col-sm-2">
                                        <a class="btn btn-add btn-sm" href="addservice" title="Thêm">
                                            <i class="fas fa-plus"></i> Thêm dịch vụ
                                        </a>
                                    </div>
                                    <div class="col-sm-2">
                                        <a class="btn btn-delete btn-sm nhap-tu-file" type="button" title="Nhập" onclick="myFunction(this)">
                                            <i class="fas fa-file-upload"></i> Tải từ file
                                        </a>
                                    </div>
                                    <div class="col-sm-2">
                                        <a class="btn btn-excel btn-sm" href="" title="In">
                                            <i class="fas fa-file-excel"></i> Xuất Excel
                                        </a>
                                    </div>
                                    <div class="col-sm-2">
                                        <a class="btn btn-delete btn-sm pdf-file" type="button" title="In" onclick="myFunction(this)">
                                            <i class="fas fa-file-pdf"></i> Xuất PDF
                                        </a>
                                    </div>
                                </div>
                                <div>
                                    <form method="get" action="searchservice" class="form-inline">
                                        <!-- Search Input -->
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control search-input" id="searchInput" name="keyword" placeholder="Tìm kiếm...">
                                            <div class="input-group-append">
                                                <button type="submit" class="btn custom-search-btn">Tìm kiếm</button>
                                            </div>
                                        </div>
                                        <div class="input-group mb-3">
                                            <select class="form-control" id="ageLimit" name="ageLimit">
                                                <option value="">Chọn độ tuổi</option>
                                                <c:forEach var="ageLimit" items="${ageLimits}">
                                                    <option value="${ageLimit.ageLimitID}">${ageLimit.ageLimit}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="input-group-append">
                                                <button type="submit" class="btn custom-filter-btn">Lọc</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <style>
                                    /* Style for Input Groups */
                                    .input-group .form-control {
                                        border-right: none;
                                    }

                                    .input-group .input-group-append .btn {
                                        border-left: none;
                                        border-radius: 0 4px 4px 0;
                                    }

                                    /* Button Styles */
                                    .custom-search-btn, .custom-filter-btn {
                                        height: 45px;
                                        padding: 0 20px;
                                        font-size: 14px;
                                    }

                                    .custom-search-btn {
                                        background-color: #F5CBA7;
                                        color: #D35400;
                                        border: 1px solid #D35400;
                                    }

                                    .custom-search-btn:hover {
                                        background-color: #D35400;
                                        color: #FFFFFF;
                                    }

                                    .custom-filter-btn {
                                        background-color: #1B2631;
                                        color: #FFFFFF;
                                        border: 1px solid #1B2631;
                                    }

                                    .custom-filter-btn:hover {
                                        background-color: #154360;
                                    }

                                    /* General Form Control */
                                    .form-control {
                                        height: 45px;
                                    }

                                    
                                </style>

                            </div>

                            <table>
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên dịch vụ</th>
                                        <th>Ảnh</th>
                                        <th>Độ tuổi</th>
                                        <th>Giá</th>
                                        <th>Thời gian tối đa</th>
                                        <th>Mô tả</th>
                                        <th>Trạng thái</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="service" items="${services}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${service.serviceName}</td>
                                            <td><img src="${pageContext.request.contextPath}/${service.serviceImage}" alt="${service.serviceName}" width="75" height="50"></td>
                                            <td>
                                                <c:forEach var="ageLimit" items="${ageLimits}">
                                                    <c:if test="${ageLimit.ageLimitID == service.ageLimitID}">
                                                        ${ageLimit.ageLimit}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td><fmt:formatNumber value="${service.price}" type="number" groupingUsed="true" /></td>
                                            <td>
                                                <c:if test="${service.duration == 0}">
                                                    Theo lịch đặt
                                                </c:if>
                                                <c:if test="${service.duration != 0}">
                                                    ${service.duration} phút
                                                </c:if>
                                            </td>
                                            <td>${service.description}</td>
                                            <td>
                                                <c:if test="${service.isActive}">
                                                    Active
                                                </c:if>
                                                <c:if test="${!service.isActive}">
                                                    Inactive
                                                </c:if>
                                            </td>
                                            <td class="table-td-center"><button class="btn btn-primary btn-sm trash" type="button" title="delete"
                                                                                onclick="return confirm('Are you sure you want to delete this service?')">
                                                    <a href="deleteservice?serviceID=${service.serviceID}"><i class="fas fa-trash-alt"></i></a>
                                                </button>
                                                <button class="btn btn-primary btn-sm" type="button" title="Sửa" id="show-emp">
                                                    <a href="editservice?serviceID=${service.serviceID}"><i class="fas fa-edit"></i></a>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </main>

        <!-- Essential javascripts for application to work-->
        <script src="js/manager/jquery-3.2.1.min.js"></script>
        <script src="js/manager/popper.min.js"></script>
        <script src="js/manager/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="src/jquery.table2excel.js"></script>
        <script src="js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
        <script>

            //EXCEL
            // $(document).ready(function () {
            //   $('#').DataTable({

            //     dom: 'Bfrtip',
            //     "buttons": [
            //       'excel'
            //     ]
            //   });
            // });


            //Thời Gian
            function time() {
                var today = new Date();
                var weekday = new Array(7);
                weekday[0] = "Chủ Nhật";
                weekday[1] = "Thứ Hai";
                weekday[2] = "Thứ Ba";
                weekday[3] = "Thứ Tư";
                weekday[4] = "Thứ Năm";
                weekday[5] = "Thứ Sáu";
                weekday[6] = "Thứ Bảy";
                var day = weekday[today.getDay()];
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                nowTime = h + " giờ " + m + " phút " + s + " giây";
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                        '</span>';
                document.getElementById("clock").innerHTML = tmp;
                clocktime = setTimeout("time()", "1000", "Javascript");

                function checkTime(i) {
                    if (i < 10) {
                        i = "0" + i;
                    }
                    return i;
                }
            }
            //In dữ liệu
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }
            //     //Sao chép dữ liệu
            //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

            // copyTextareaBtn.addEventListener('click', function(event) {
            //   var copyTextarea = document.querySelector('.js-copytextarea');
            //   copyTextarea.focus();
            //   copyTextarea.select();

            //   try {
            //     var successful = document.execCommand('copy');
            //     var msg = successful ? 'successful' : 'unsuccessful';
            //     console.log('Copying text command was ' + msg);
            //   } catch (err) {
            //     console.log('Oops, unable to copy');
            //   }
            // });


            //Modal
            $("#show-emp").on("click", function () {
                $("#ModalUP").modal({backdrop: false, keyboard: false})
            });
        </script>

    </body>

</html>

