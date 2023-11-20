### Welcome to the Updated BC Liqour App
First a concession: I apologize, I completed this assignment by the old rules before Lucy posted about the change in Canvas, so my app is not novel but contains several updates to Dean Attalis original BC Liquour App as created in his shiny tutorial.

This app allows users to use widgets to navegate through the BC Liquour inventory according to multiple different criterion (price, country, alcohol %, type, and subtype). Results will be displayed as a historgram to view the distribution of products based on user selection and as a list of all products that fit user selected criteria. 

**Data Source**

The original shiny app comes from Dean Attalis' [Building Shiny Apps Tutorial](https://deanattali.com/blog/building-shiny-apps-tutorial/)

The BC Liquor Data is a commonly used practice dataset from [Open Data BC's Open Data Catalougue](https://catalogue.data.gov.bc.ca/dataset/bc-liquor-store-product-price-list-historical-prices)

### There are multiple updates from the original BC Liquor App

**1)** A dropdown widget to select drink **subtype** which varies according to drink **type** selection from the radio buttons. This allows users to narrow a type selection according to more specific drink preference. For example, now instead of just selecting "wine", a user may select "wine" from the radio buttons and then select "red wine" from the **subtype** dropdown.

**2)** An 'ALL' option has been added to the **country** and **subtype** dropdown widgets to allow for more robust navigation as the original country selection was pretty limiting. I found this to be a big functional advantage as it does not restrict users like before. Before adding the "ALL" selection, each search was restricted by country, which has dozens of options. Now, with "ALL" as the default for countries, users may browse more effectively, and still have the option to search for country if they like alcohol from a specific country in particular.

**3)** Added a graphic of two cool little beer guys hanging out in the sidebar panel. I feel like the value of these guys needs no explination. 

**4)** Changed the histogram appearance to include a wider range of prices and to a more exciting yellow color. The braoder range of starting prices allows users to narrow their search to their preference. The yellow bars just make the whole thing look better.

### Running the app in your own web page
To access the new and improved BC liquor app, you can access my shiny app account at danrobinson.shinyapps.io

To get straight to the app, click this [link](https://danrobinson.shinyapps.io/bcl_app/)
