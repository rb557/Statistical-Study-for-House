# Statistical-Study-for-House
The problem is to discover relation between US new house construction starts data (HOUST) and macro economic indicators: GDP, CPI and Population (POP).The description for this data can be found in https://fred.stlouisfed.org/.

# Description about the data:
CPI <- Consumer Price Index
The Consumer Price Index (CPI) is a measure of the average change over time in the prices paid by urban consumers for a market basket of consumer goods and services. Indexes are available for the U.S. and various geographic areas. Average price data for select utility, automotive fuel, and food items are also available.
- As an economic indicator. As the most widely used measure of inflation, the CPI is an indicator of the effectiveness of government policy. In addition, business executives, labor leaders and other private citizens use the index as a guide in making economic decisions.
- As a means for adjusting income payments. Over 2 million workers are covered by collective bargaining agreements which tie wages to the CPI. The index affects the income of almost 80 million people as a result of statutory action: 47.8 million Social Security beneficiaries, about 4.1 million military and Federal Civil Service retirees and survivors, and about 22.4 million food stamp recipients. Changes in the CPI also affect the cost of lunches for the 26.7 million children who eat lunch at school. Some private firms and individuals use the CPI to keep rents, royalties, alimony payments and child support payments in line with changing prices. Since 1985, the CPI has been used to adjust the Federal income tax structure to prevent inflation-induced increases in taxes.

GDP <- Gross Domestic Product
The value of the goods and services produced in the United States is the gross domestic product. The percentage that GDP grew (or shrank) from one period to another is an important way for Americans to gauge how their economy is doing. The United States' GDP is also watched around the world as an economic barometer.
What can you do with GDP numbers?
.How fast is the U.S. economy growing?
.How does my state's economy stack up against others?
.Which industries are taking growing? Which are slowing?

Population <- It is the population number.
Population includes resident population plus armed forces overseas. The monthly estimate is the average of estimates for the first of the month and the first of the following month.

# The Statiscal presentation made in R will represent the following.

1.Data preparation: combine all data into an R dataframe object, and construct dummy or factor variable for 4 quarters. First model is HOUST ∼ GDP + CPI + quarter.

2.Data needs some cleaning.

3.Seasonal effect observed in data if any.

4.A pair-wise comparison for different quarters. Which quarter do you think is the best one to buy a house?
