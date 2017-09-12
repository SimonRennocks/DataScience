import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

s = pd.Series(np.random.randn(1000), index=pd.date_range('1/1/2000', periods=1000))
s = s.cumsum()
r = s.rolling(window=60)

s.plot(style='k--')
r.mean().plot(style='k')

df = pd.DataFrame(np.random.randn(1000, 4),
    index=pd.date_range('1/1/2000', periods=1000),
    columns=['A', 'B', 'C', 'D'])

df = df.cumsum()
df.rolling(window=60).sum().plot(subplots=True)

plt.show()