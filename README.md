# Interactive Fire Analytics Report System


This project delivers the interactive fire analytics report to the user. It is a Data Analytics project integrated with Software engineering components to automate things as much as possible.

## Authors

- Hunter

- Mahesh

- Park

- Pranavi

- Sasi


## Architecture

![Picture1](https://user-images.githubusercontent.com/105023580/167268187-0110c0bc-a2d8-4d11-85da-40d91ca644ca.png)

UI Framework:
---------------
UI framework is java based web application integrated with google maps. The home page facilitates the users to select the location which user is interested in the USA  and the date.

brewlytics:
------------
The data source we use for this project is NASA fire accident data which is coming from the brewlytics tool. We used the brewlytics tool extensively for the data pre-processing. 
There are 2 workflows we created for data processing, 
	1) one delivers the past 7 days fire accident starting today. 
	2) the other delivers the historical data. For the historical workflow, we downloaded data from NASA for the past ten years and then did the data processing.

Tableau Automation:
---------------------

Data Analyst pre-built the visualization using historical data in Tableau and publish them to the Tableau server. Using tableau automation whenever the data gets refreshed we do not need to publish the visualization instead we can publish the data source using Tableau APIs.
Also, the visualization published in Tableau is embedded as a javascript snippet in the final UI report. Whenever the user performs a new search the data gets published automatically to the visualization in the tableau server and the final report reflects the change.

Machine Learning Model:
-------------------------
Data Analysts train a machine model using the past 10 years' worth of Historical data and the model predicts the fire accidents for the next five days from the user's data and the AOI.
Finally, the results are consolidated in an HTML template and get delivered to the user.
## Tech Stack

**Java:**  Language

**Google Maps:**  Home screen

**Java Script:**  Web Application

**Spring:**  Web Application

**Tableau:**  Final Report

**Random Forest Algorithm:**  Modeling

**Python:** Machine Learning and Visualizations

**brewlytics:** Data Pre Processing

## Final Report

![Screenshot (26)](https://user-images.githubusercontent.com/105023580/167268474-7b68df87-fba7-4695-8b54-6bcb5eb02a8a.png)
![Screenshot (30)](https://user-images.githubusercontent.com/105023580/167268479-00b2ccaa-8d22-4c43-b1e1-5f1fc076bd63.png)
![Screenshot (28)](https://user-images.githubusercontent.com/105023580/167268477-0eb2572d-c282-4bb8-b53c-515d9f4e460c.png)
![Screenshot (27)](https://user-images.githubusercontent.com/105023580/167268476-b2c7a630-54c0-4c13-8af6-a18d3a2444f9.png)

## API Reference

#### Get FIRMS fire accident data.

```https
  GET /api/jobs
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `m` | `string` | **Required**. Your API key |
| `AOI_7df0e2d1-e66b-44f7-8576-fb070d6f1c62` | `string` | **Required**. Geometric Point |
| `Date` | `string` | **Required**. Date |


#### Required Headers

X-REQUEST-TOKEN - This is specific to the workflow. The workflow shared as a Rest API in brewlytics validate this header.
