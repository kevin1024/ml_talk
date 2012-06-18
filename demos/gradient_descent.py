import csv
from sklearn import linear_model
import pylab
housing_data = csv.reader(open('housing_data.csv', 'rb'))

features = []
output = []

for row in housing_data:
    #features.append([float(row[0]), float(row[1]), float(row[2])])
    features.append([float(row[0])])
    output.append(int(row[1]))


clf = linear_model.LinearRegression(fit_intercept=True, normalize=True)
clf.fit(features, output)
print clf.coef_

pylab.scatter(features, output)
pylab.plot(features)
pylab.show()
