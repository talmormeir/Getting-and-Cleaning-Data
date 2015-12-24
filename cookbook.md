#Code Book
##Raw data collection
###Collection
Raw data are obtained from UCI Machine Learning repository. 
The experiments have been carried out with a group of volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured. The raw dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  can provide further details about this dataset. 

The attributes information available from the study are:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


The set of variables that were estimated from these attributes are:
- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values.
- iqr(): Interquartile range
- entropy(): Signal entropy
- arCoeff(): Autoregression coefficients with Burg order equal to 4
- correlation(): Correlation coefficient between two signals
- maxInds(): Index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): Skewness of the frequency domain signal
- kurtosis(): Kurtosis of the frequency domain signal
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between some vectors.


No unit of measures are reported as all features were normalized and bounded within [-1,1].

##Data Anaylsis
The raw data sets are processed with run_analisys.R script and follow the outline procedure below: 
1. Merge training and test sets
2. Extract mean and stdv. variables
3. Eloboration on the activity description
4. Expand variable descriptions
5. The creation of a new tidy dataset

Data dimensions are described in readme.md dile

