sidebar <- dashboardSidebar(
  # sidebarMenu(id = "sidebar",
  #   menuItem("Suivi des ventes", tabName = "features", icon = icon("cart-arrow-down")),
  #   menuItem("Performance du modèle", tabName = "modelperf", icon = icon("chart-line")),
  #   menuItem("Stabilité des inputs", tabName = "driftscore", icon = icon("chart-line"))
  # )
  sidebarMenu(id = "sidebar",
              # menuItem("Suivi des ventes", tabName = "features", icon = icon("cart-arrow-down")),
              menuItem("Synthèse", tabName = "synthese", icon=icon("tachometer-alt")),
              menuItem("Etat de santé du modèle", tabName = "stabinputs", icon = icon("first-aid"), 
                       menuItem("Performance du modèle", tabName = "modelperf", icon = icon("chart-line")), 
                       menuItem("Indicateurs scores", tabName = "scoredistrib", icon = icon("chart-line"))
                       ),
              menuItem("Stabilité des inputs", tabName = "stabinputs", icon = icon("chart-line"), 
                       menuItem("Indicateurs univariés", 
                                tabName = "features", icon = icon("cart-arrow-down")), 
                       menuItem("Indicateurs globaux", 
                                tabName = "driftscore", icon = icon("chart-line")))
  )
  # ,
  # conditionalPanel(condition = "document.getElementsByClassName('sidebar-menu')[0].children[0].className=='active'",
  #   hr(),
  #   selectInput("feature", "Choisir une feature", choices=setdiff(colnames(features_train),c("X", "MONTH", "Customer.ID", "VAR_REP", "YEAR")))    
  # )
)

header <- dashboardHeader(title = "Webinaire MLOps",
                          dropdownMenuOutput("alerts"))

body <- dashboardBody(
  useShinyjs(),
  tags$link(rel="stylesheet", type="text/css", href="css/style.css"),
  tags$script(src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"),
  
  img(src="img/logoDS.png", class="ribbon", style="margin-right: 1.3cm;cm;margin-top: 0.2cm;margin-bottom: 0.1cm;height: 38px"),
  
  div(style="position:relative; top:-20px;background-color:#fff;padding:20px;box-shadow: 0 10px 6px -6px #999;z-index:5;", 
      sliderInput("t",
                  "Observation du monitoring en date du :",
                  min = as.Date("2010-09-01","%Y-%m-%d"),
                  max = as.Date("2012-01-01","%Y-%m-%d"),
                  step = 30, 
                  #animate = T,
                  value=as.Date("2010-11-27"),
                  timeFormat="%Y-%m", width="100%")

  ),
  tags$script("document.getElementsByClassName('control-label')[0].style['font-size']='13pt';"),
  
  div(style="position:relative; top:-20px;padding-left:15px;padding-right:15px;overflow-y:scroll;height:calc(100vh - 175px);",
      br(),
      tabItems(
        tabItem(tabName = "synthese", source("src/ui/synthese_ui.R", local = T)$value),
        tabItem(tabName = "features", source("src/ui/features_ui.R", local = T)$value),
        tabItem(tabName = "modelperf", source("src/ui/modelperf_ui.R", local = T)$value),
        tabItem(tabName = "driftscore", source("src/ui/driftscore_ui.R", local = T)$value),
        tabItem(tabName = "scoredistrib", source("src/ui/scoresdistrib_ui.R", local = T)$value)
      )
  )
)


# if(!dev){
#   secure_app(
#     dashboardPage(
#       header,
#       sidebar,
#       body), 
#     tags_top = tags$img(src = "img/logoDS.png", width = 200),
#     tags_bottom = tags$div(tags$p("MLops Webinar - 2020/12/15"), align = "center"),
#     language = "fr",
#     background = "linear-gradient(to top, #d5d4d0 0%, #d5d4d0 1%, #eeeeec 31%, #efeeec 75%, #e9e9e7 100%);",
#     enable_admin = TRUE)  
# } else {
  dashboardPage(
    header,
    sidebar,
    body)
# }