# data-analysis-code
This repository holds the code and data for the research project "Skimming the Free-to-Play First-Penny Gap: Selling Virtual Good Endowments in Mobile Games."

All information that could identify the researcher(s) or the collaborating company has been blinded or removed. The user-level data cannot be shared due to the GDPR at the request of the collaborating company. Instead, data are shared aggregated as mean and standard deviation across country and device segments such that no user-level information is publicly shared. Should you wish to get access to the user-level data for replication, please reach out to the corresponding author (contact information to be added post blinded review process).

Each "Experiment" folder contains the SQL code run against the collaborating company's databases to export datasets for the research, the R code used to massage the data further, and the aggregated data that can be shared publicly.

In the main folder, the file "main-analysis.R" shows the R code applied to the well-behaved CSV datasets to conduct the analysis described in the paper. The file "randomization-checks.R" shows the R code used to generate the randomization checks shown in the paper's web appendix. The files "treatment-effect-heterogeneity-....R" show the R code used to conduct a nonparametric assessment of interaction effects as described in the paper and shown in the web appendix.

The main folder also contains the data files from the World Bank's World Development Indicators that were used to enrich the datasets with GDP per capita information based on the country the user was using the app from. This information was used for the analysis on "Inclusion in premium experiences" shown in the paper's Discussion section.

Please reach out to the corresponding author in case of questions (contact information to be added post blinded review process).
