{\rtf1\ansi\ansicpg1252\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # My Lesson\
This app just shows Lessons.\
I have created the task test in multiple steps.\
\
# UIScreens\
I have created the UIScreens using UIKit in storyboard. \
\
# API Integration\
In this application, we have followed MVVM architecture in making the application. We have used some libraries for network calling I.e Alamofire and SwiftyJSON. \
\
# Architecture \
The view is basically the presentation layer of the application. It interacts with the ViewModel. The viewModel contains all the business logic of the Application. The viewModel calls the Api\'92s and interacts with the model for the data. The Model contains the data structure in which the data loads from the APIs. The Model returns the data to the ViewModel. The ViewModel binds the data and pass to the View. The View updates the presentation layer and show it to the user.\
\
# ViewController\
The name of View Controllers that we are using in the Application are given below.\
1. LiveHomeVC\
2. MyLessonVC\
\
# Model\
The name of Model that we are using in the Application are given below.\
1. LessonsModel\
\
# HelperClasses \
I have created some helper classes for the purpose of clean coding. All the variables and constants that are used in the application is on these files.\
\
# Extensions\
I have used some extensions in the Application in which I have written some error handing Alert and toasts. Moreover I have written some UI related changes in the extension file.\
\
# Pods\
I have used the following pod files in the application.\
\
1. Alamofire\
2. SwiftyJSON\
3. KIngFisher\
4. SnackBar.swift}