# Fraud Detection Project

## Overview

This project aims to develop a fraudulent online shops detection system using machine learning techniques. The system will analyze website data to identify potential fraudulent websites. This repository shows a practice of training a neural network with AWS tools.

## Project Structure

* **data/**: Contains the dataset used for training and testing.
* **src/dataset_creation**: Contains scripts for creating dataset from original dataset.

## Dataset

The dataset used in this practice is *Fraudulent and Legitimate Online Shops Dataset* published by Audrone Janaviciute and Agnius Liutkevicius (2023) [1](#dataset_ref). The dataset contains fake (fraudulent) e-shops data together with legitimate e-shops data. The dataset is balanced and contains 1140 records of 579 fake (fraudulent) and 561 real (legitimate) online shops. 

This dataset was loaded into a database with the following structure, in order to show the use of MySQL in RDS.

![database model](./resources/database_model.png)

### Glue ETL.

TODO

RDS --(Conector)--> Crawler --> Data catalog --> Glue notebook

# References

- <a name="dataset_ref"></a> [1] Janaviciute, Audrone; Liutkevicius, Agnius (2023), "Fraudulent and Legitimate Online Shops Dataset", Mendeley Data, V1, doi: 10.17632/m7xtkx7g5m.1

