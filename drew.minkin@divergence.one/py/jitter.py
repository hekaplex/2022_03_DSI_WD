# Prolog - Auto Generated #
import os, uuid, matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot
import pandas

import sys
sys.tracebacklimit = 0

os.chdir(u'C:/Users/andre/PythonEditorWrapper_b984f5bb-17b6-4886-9fdb-b627dbd29518')
dataset = pandas.read_csv('input_df_70b5b904-d8fc-4037-8c79-fc8fd92e5c59.csv')

matplotlib.pyplot.figure(figsize=(5.55555555555556,4.16666666666667), dpi=72)
matplotlib.pyplot.show = lambda args=None,kw=None: matplotlib.pyplot.savefig(str(uuid.uuid1()))
# Original Script. Please update your script content here and once completed copy below section back to the original editing window #
# The following code to create a dataframe and remove duplicated rows is always executed and acts as a preamble for your script: 

# dataset = pandas.DataFrame(SalePrice, SaleCondition)
# dataset = dataset.drop_duplicates()

# Paste or type your script code here:
import itertools
from matplotlib.cbook import _reshape_2D
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
# Function adapted from matplotlib.cbook
def my_boxplot_stats(X, whis=1.5, bootstrap=None, labels=None,
                  autorange=False, percents=[25, 75]):

    def _bootstrap_median(data, N=5000):
        # determine 95% confidence intervals of the median
        M = len(data)
        percentiles = [2.5, 97.5]

        bs_index = np.random.randint(M, size=(N, M))
        bsData = data[bs_index]
        estimate = np.median(bsData, axis=1, overwrite_input=True)

        CI = np.percentile(estimate, percentiles)
        return CI

    def _compute_conf_interval(data, med, iqr, bootstrap):
        if bootstrap is not None:
            # Do a bootstrap estimate of notch locations.
            # get conf. intervals around median
            CI = _bootstrap_median(data, N=bootstrap)
            notch_min = CI[0]
            notch_max = CI[1]
        else:

            N = len(data)
            notch_min = med - 1.57 * iqr / np.sqrt(N)
            notch_max = med + 1.57 * iqr / np.sqrt(N)

        return notch_min, notch_max

    # output is a list of dicts
    bxpstats = []

    # convert X to a list of lists
    X = _reshape_2D(X, "X")

    ncols = len(X)
    if labels is None:
        labels = itertools.repeat(None)
    elif len(labels) != ncols:
        raise ValueError("Dimensions of labels and X must be compatible")

    input_whis = whis
    for ii, (x, label) in enumerate(zip(X, labels)):

        # empty dict
        stats = {}
        if label is not None:
            stats['label'] = label

        # restore whis to the input values in case it got changed in the loop
        whis = input_whis

        # note tricksyness, append up here and then mutate below
        bxpstats.append(stats)

        # if empty, bail
        if len(x) == 0:
            stats['fliers'] = np.array([])
            stats['mean'] = np.nan
            stats['med'] = np.nan
            stats['q1'] = np.nan
            stats['q3'] = np.nan
            stats['cilo'] = np.nan
            stats['cihi'] = np.nan
            stats['whislo'] = np.nan
            stats['whishi'] = np.nan
            stats['med'] = np.nan
            continue

        # up-convert to an array, just to be safe
        x = np.asarray(x)

        # arithmetic mean
        stats['mean'] = np.mean(x)

        # median
        med = np.percentile(x, 50)
        ## Altered line
        q1, q3 = np.percentile(x, (percents[0], percents[1]))

        # interquartile range
        stats['iqr'] = q3 - q1
        if stats['iqr'] == 0 and autorange:
            whis = 'range'

        # conf. interval around median
        stats['cilo'], stats['cihi'] = _compute_conf_interval(
            x, med, stats['iqr'], bootstrap
        )

        # lowest/highest non-outliers
        if np.isscalar(whis):
            if np.isreal(whis):
                loval = q1 - whis * stats['iqr']
                hival = q3 + whis * stats['iqr']
            elif whis in ['range', 'limit', 'limits', 'min/max']:
                loval = np.min(x)
                hival = np.max(x)
            else:
                raise ValueError('whis must be a float, valid string, or list '
                                 'of percentiles')
        else:
            loval = np.percentile(x, whis[0])
            hival = np.percentile(x, whis[1])

        # get high extreme
        wiskhi = np.compress(x <= hival, x)
        if len(wiskhi) == 0 or np.max(wiskhi) < q3:
            stats['whishi'] = q3
        else:
            stats['whishi'] = np.max(wiskhi)

        # get low extreme
        wisklo = np.compress(x >= loval, x)
        if len(wisklo) == 0 or np.min(wisklo) > q1:
            stats['whislo'] = q1
        else:
            stats['whislo'] = np.min(wisklo)

        # compute a single array of outliers
        stats['fliers'] = np.hstack([
            np.compress(x < stats['whislo'], x),
            np.compress(x > stats['whishi'], x)
        ])

        # add in the remaining stats
        stats['q1'], stats['med'], stats['q3'] = q1, med, q3

    return bxpstats
# This section is new code    
#used to remove 'nan' from columns when a GUID was supplied
def no_non(lst):
    outp = [x for x in lst if str(x) != 'nan']
    return outp
    #takes label for column and its data and returns teh calcs formatted for a boxplot tick
def get_legend (data,label):
    plot_metric = str(label)+"\n"
    plot_min = "\nmin: "+str(np.round(np.min(data),2))
    plot_mean = "\nmean: "+str(np.round(np.mean(data),2))
    plot_median = "\nmedian: "+str(np.round(np.median(data),2))
    plot_max = "\nmax: "+str(np.round(np.max(data),2))
    plot_qty = "\nN = "+str(len(data))
    plot_cv = "\nCV = "+str(np.round(100.0*np.std(data)/np.mean(data),2))+"%"
    return plot_metric + plot_min + plot_max + plot_mean + plot_median + plot_qty + plot_cv
warning = '''
        WARNING
        ========================
        Code supports two schemas without editing:
        1. a table with col1 as metric and col2 as series with each distinct col2 value making a separate boxplot
        2. a table with only numerics and each column as a separate boxplot
'''

#optional - detect long or wide
if "object" in str(dataset.dtypes):
    df = pd.pivot_table(
        dataset
        #change here to standarize on positions
        , values= [dataset.columns[0]]
        #change here to standarize on positions
        , columns=[dataset.columns[1]]
        ,index=dataset.index
        , aggfunc=np.mean)
        #extract columns from dataframe into alist of numpy arrays for rendering compatibility
dfx2 = [no_non(x) for x in [ df.iloc[:,df.columns.get_loc(x)].to_numpy() for x in df.columns]]

#extract series labels/ticks
cols = [col for col in df.columns]
lbl = [col[1] for col in cols]
#generate list of positions for each boxplot to render
boxlist = {col: my_boxplot_stats(dfx2[cols.index(col)]) for col in cols}

#TODO - Add function wrapper for plot adding parameters for all plot configuration
#TODO - Add switch logic for full customization to use quantile profile to map to statsmodel
#https://blogs.sas.com/content/iml/2017/05/24/definitions-sample-quantiles.html
boxout = [boxlist[x][0] for x in boxlist]
#boxplot style
boxprops = {'linewidth': 1, 'color': 'blue'}
flierprops = {'marker': 'o','markerfacecolor': 'green','markersize': 12,'linestyle': 'none'}
medianprops = {'linewidth': 2, 'color': 'blue'}
meanpointprops = {'marker': 'X','linewidth': 1,'markeredgecolor': 'blue','markerfacecolor': 'blue'}
# Plot boxplots from our computed statistics  CHANGE "figsize" value to vary the width of the plot
fig, ax = plt.subplots(1, 1,figsize=(int(len(dfx2)*4),
#I had to adjust this number to get all the legend to show up
14 ))
boxpos = len(boxout)+1
Q = ax.bxp(
boxout
, widths = 0.75
, positions=range(len(boxout))
, showmeans = True
, boxprops=boxprops
, medianprops = medianprops
, whiskerprops = boxprops
, capprops = boxprops
, meanprops = meanpointprops
)
#legend calcs
lgnd = [get_legend(dfx2[i],lbl[i]) for i in range(len(dfx2))]
ax.grid(None)
ax.spines['top'].set_color('#FFFFFF')
ax.spines['right'].set_color('#FFFFFF')
ax.spines['bottom'].set_color('#FFFFFF')
ax.spines['left'].set_color('#FFFFFF')
#EDIT HERE FOR CUSTOM TITLE
#ax.set_title('GFlops')
ax.set_title(dataset.columns[0])
plt.xticks([x for x in range(len(dfx2))], lgnd)
#jitter
color = 'tab:red'
jitterx =[(i)+(0.5*(np.random.random() - 0.5)) for i in range(len(dfx2)) for x in dfx2[i]]
jittery = [x[z] for x in dfx2 for z in range(len(x))]
ax.scatter(jitterx, jittery, color=color)
#render
plt.show()

# Epilog - Auto Generated #
os.chdir(u'C:/Users/andre/PythonEditorWrapper_b984f5bb-17b6-4886-9fdb-b627dbd29518')
