<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <!-- Link Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
        <!-- Link Font Awesome Library -->
        <link rel="stylesheet" href="temp/CSS/all.min.css">
        <!-- Always Put Your Files After the Library and Frameworks To Override it -->
        <!-- Link Framework -->
        <link rel="stylesheet" href="temp/CSS/Framework.css">
        <!-- Link CSS -->
        <link rel="stylesheet" href="temp/CSS/Styles.css">
    </head>
    <body>
        <!-- Page is the Container -->
        <div class="page d-flex">
            <div class="sidebar bg-white p-20 p-relative">
                <h3 class="p-relative txt-c mt-0">Panel</h3>
                <ul>
                    <!-- Class fa-fw to fix the width to make all icons same width -->
                    <li>
                        <!-- anchor so it wont be full width so we need to change display to get full width cuz its inline -->
                        <a class="active d-flex align-center fs-14 c-black rad-5 p-10" href="HomePage.jsp">
                            <i class="fa-solid fa-chart-simple fa-fw"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>

                     <li>
                        <a class="d-flex align-center fs-14 c-black rad-5 p-10" href="Country.jsp"><i class="fa-solid fa-user fa-fw"></i>
                            <span>Country</span>
                        </a>
                    </li>
                    
                     <li>
                        <a class="d-flex align-center fs-14 c-black rad-5 p-10" href="State.jsp"><i class="fa-solid fa-user fa-fw"></i>
                            <span>State</span>
                        </a>
                    </li>
                     <li>
                        <a class="d-flex align-center fs-14 c-black rad-5 p-10" href="District.jsp"><i class="fa-solid fa-user fa-fw"></i>
                            <span>District</span>
                        </a>
                    </li>
                     <li>
                        <a class="d-flex align-center fs-14 c-black rad-5 p-10" href="Place.jsp"><i class="fa-solid fa-user fa-fw"></i>
                            <span>Place</span>
                        </a>
                    </li>
                     <li>
                        <a class="d-flex align-center fs-14 c-black rad-5 p-10" href="TicketType.jsp"><i class="fa-solid fa-user fa-fw"></i>
                            <span>Ticket Type</span>
                        </a>
                          <li>
                        <a class="d-flex align-center fs-14 c-black rad-5 p-10" href="location.jsp"><i class="fa-solid fa-user fa-fw"></i>
                            <span>Location</span>
                        </a>
                    </li>
                     <li>
                        <a class="d-flex align-center fs-14 c-black rad-5 p-10" href="add package.jsp"><i class="fa-solid fa-user fa-fw"></i>
                            <span>Add Package</span>
                        </a>
                    </li>
                     <li>
                        <a class="d-flex align-center fs-14 c-black rad-5 p-10" href="gallery.jsp"><i class="fa-solid fa-user fa-fw"></i>
                            <span>Gallary</span>
                        </a>
                    </li>
                     <li>
                        <a class="d-flex align-center fs-14 c-black rad-5 p-10" href="slocation.jsp"><i class="fa-solid fa-user fa-fw"></i>
                            <span>Location</span>
                        </a>
                    </li>
                    
                     <li>
                        <a class="d-flex align-center fs-14 c-black rad-5 p-10" href="sgallary.jsp"><i class="fa-solid fa-user fa-fw"></i>
                            <span>View Gallary</span>
                        </a>
                    </li>
                    
                    <li>
                </ul>
            </div>
            <div class="content w-full">