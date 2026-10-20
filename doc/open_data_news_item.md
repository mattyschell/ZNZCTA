# ZIP Code Boundaries on NYC Open Data

"In matters of style, swim with the current. In matters of principle, stand like a rock." --Gucci Mane and Thomas Jefferson

## A Matter of Principle: ZIP Code Boundaries Do Not Exist

The United States Postal Service introduced the Zone Improvement Program (ZIP) in 1963 to improve mail delivery. A ZIP code is tied to delivery locations such as homes, buildings, and post office boxes. In other words, ZIP codes are made up of points where mail is delivered, not official lines on a map.

The Postal Service does not release official ZIP code boundaries. To understand why, imagine two nearby cul-de-sacs. Houses on the left use ZIP code 12345. Houses on the right use ZIP code 11223.

![Two neighboring cul-de-sacs with different ZIP codes. Mr ZIP himself is delivering mail to ZIP code 12345](zip-boundary.png)

Where would the boundary go? Should it follow trees in the backyards? Should it follow a property line? Somewhere else? 

You know who doesn't need to decide where the ZIP code boundary is? The U.S. Postal Service. They deliver mail to addresses, not to crabgrass.

Still, those who work with data frequently need mapped areas for ZIP codes. Because people readily know their ZIP code, surveys and other data collection efforts sometimes collect it as the only geographic information. When designing data collection, it is worth asking what level of geography will be most useful for analysis.

## A Matter Of Style: ZIP Code Tabulation Areas Are Trending With Users 

The United States Census Bureau publishes ZIP Code Tabulation Areas, or ZCTAs. ZCTAs are area-based approximations of ZIP codes. They are built from census blocks, which are small geographic areas used and published by the Census Bureau.

The Census Bureau starts with ZIP code point locations and assigns each census block to one ZIP code. Some blocks include addresses with more than one ZIP code. In those cases the block is assigned to the ZIP code used by the most addresses. See [this Census Bureau page](https://www.census.gov/programs-surveys/geography/guidance/geo-areas/zctas.html) for more details. 

ZCTAs are:

* useful for mapping and statistical analysis
* an official Census Bureau geography
* updated every 10 years but otherwise stable

ZCTAs do not:

* include every valid ZIP code
* include water areas

ZCTA boundaries, like ZIP code point distributions, vary in size and shape and suffer from the [modifiable areal unit problem](https://en.wikipedia.org/wiki/Modifiable_areal_unit_problem). Some ZCTAs in Manhattan encompass a single building.

<img src="maup-1.png" alt="A mapped illustration of ZCTAs in Manhattan" style="border: 2px solid #777;">

By contrast, ZCTA 10465 in the Bronx covers almost four square miles and thousands of buildings.

<img src="maup-2.png" alt="A mapped illustration of ZCTA 10465 in The Bronx" style="border: 2px solid #777;">

## ZCTAs on NYC Open Data

People often look for ZIP code boundaries on NYC Open Data, but there is no official local ZIP code file to publish. To help meet that need, the Office of Technology and Innovation recently published a subset of the Census Bureau's 2020 ZCTAs.

https://data.cityofnewyork.us/City-Government/ZIP-Code-Tabulation-Areas/35j5-n34v/about_data

These ZCTAs have been clipped back to the boundary of New York City. Some small edge ZCTAs are present where New York City addresses fall in ZCTAs more commonly associated with Westchester County or Nassau County. 

![A mapped illustration of ZCTAs](zcta-map.png)

NYC Open Data also publishes geographies that may be better suited for some styles of analysis. Consider the following:

[Neighborhood Tabulation Areas](https://data.cityofnewyork.us/City-Government/2020-Neighborhood-Tabulation-Areas-NTAs-/9nt8-h7nd/about_data)

* Pro: Good statistical rigor
* Con: Neighborhood names and boundaries can be a fraught topic

[Community Districts](https://data.cityofnewyork.us/City-Government/Community-Districts/5crt-au7u/about_data) 

* Pro: An official geography of New York City
* Con: Not readily known by most people

[Address Point](https://data.cityofnewyork.us/City-Government/AddressPoint/uf93-f8nk/about_data)

* Pro: This is often the source data that is rolled up to ZIP codes or ZCTAs
* Con: Analysis and visualization of point data may require effort like bucketing into grids (for example [H3](https://h3geo.org/)), cells (for example [S2](https://s2geometry.io/devguide/s2cell_hierarchy.html)), or some other geography

With those alternatives in mind, stand firm on the principle that ZIP codes guide mail delivery. Instead, swim with geographic style and ask yourself if ZCTAs or some other geography is best for what your analysis actually needs.






