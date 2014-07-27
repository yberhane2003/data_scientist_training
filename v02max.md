Estimating VO2 max[in mL/(kg.mim)] using 1 Mile Walk Test
========================================================
author: 
date: Sun Jul 27 19:26:32 2014


========================================================


A study conducted by George et al. (1993) used the heart rates, body weights, and one mile jog times from 54 students to create a mathematical equation for VO2 max.

To perform this VO2max test you'll need to have a stopwatch with you to record the exact time it will take you to walk the measured 1 mile distance. Walk the measured distance of 1 mile as quickly as you can. Do not run, simply Walk as fast as you can. At the end of the 1 mile course immediately stop your stopwatch and take your pulse for one minute. Record the time it took you to walk the 1 mile and your one minute pulse count. Then cool down for a few minutes by walking slowly. Once all of this is done, enter your data into the relevant fields below to calculate your estimated VO2max.


========================================================
VO2max = 132.853 - 0.0769W - 0.3877A + 6.315G - 3.2649T - 0.1565H 

where

W = Weight (in pounds) 
A = Age (in years) 
G = Gender factor (G = 0 for a female, G = 1 for a male) 
T = Test completion time (in minutes) 
H = Heart rate at test completion (beats/minute)


```r
vomax <- function(W,A,G,Mn,Sc,Pc) {132.853 - 0.0769*W - 0.3877*A + 6.315*G - 3.2649*Mn - (3.2649/60)*Sc - 0.1565*Pc  }
vomax(170,31,1,8,0,120)
```

```
[1] 69.18
```


========================================================
Maximal oxygen uptake norms for men (ml/kg/min)

<table width="80%" class="list">
        <tbody><tr>
          <td align="right">&nbsp;</td>
          <th colspan="6">Age (years)</th>
        </tr>
        <tr>
          <th align="left">rating</th>
          <th>18-25</th>
          <th>26-35</th>
          <th>36-45</th>
          <th>46-55</th>
          <th>56-65</th>
          <th>65+</th>
        </tr>
        <tr>
          <td align="left">excellent </td>
          <td>&gt; 60 </td>
          <td>&gt; 56 </td>
          <td>&gt; 51 </td>
          <td>&gt; 45 </td>
          <td>&gt; 41 </td>
          <td>&gt; 37 </td>
        </tr>
        <tr>
          <td align="left">good </td>
          <td>52-60 </td>
          <td>49-56 </td>
          <td>43-51 </td>
          <td>39-45 </td>
          <td>36-41 </td>
          <td>33-37 </td>
        </tr>
        <tr>
          <td align="left">above average </td>
          <td>47-51 </td>
          <td>43-48 </td>
          <td>39-42 </td>
          <td>36-38 </td>
          <td>32-35 </td>
          <td>29-32 </td>
        </tr>
        <tr>
          <td align="left">average </td>
          <td>42-46 </td>
          <td>40-42 </td>
          <td>35-38 </td>
          <td>32-35 </td>
          <td>30-31 </td>
          <td>26-28 </td>
        </tr>
        <tr>
          <td align="left">below average </td>
          <td>37-41 </td>
          <td>35-39 </td>
          <td>31-34 </td>
          <td>29-31 </td>
          <td>26-29 </td>
          <td>22-25 </td>
        </tr>
        <tr>
          <td align="left">poor </td>
          <td>30-36 </td>
          <td>30-34 </td>
          <td>26-30 </td>
          <td>25-28 </td>
          <td>22-25 </td>
          <td>20-21 </td>
        </tr>
        <tr>
          <td align="left">very poor </td>
          <td>&lt; 30 </td>
          <td>&lt; 30 </td>
          <td>&lt; 26 </td>
          <td>&lt; 25 </td>
          <td>&lt; 22 </td>
          <td>&lt; 20 </td>
        </tr>
      </tbody></table>


========================================================
Maximal oxygen uptake norms for women (ml/kg/min)

<table width="80%" class="list">
        <tbody><tr>
          <td align="right">&nbsp;</td>
          <th colspan="6">Age (years)</th>
        </tr>
        <tr>
          <th align="left">rating</th>
          <th>18-25</th>
          <th>26-35</th>
          <th>36-45</th>
          <th>46-55</th>
          <th>56-65</th>
          <th>65+</th>
        </tr>
        <tr>
          <td align="left">excellent </td>
          <td>&gt; 56 </td>
          <td>&gt; 52 </td>
          <td>&gt; 45 </td>
          <td>&gt; 40 </td>
          <td>&gt; 37 </td>
          <td>&gt; 32 </td>
        </tr>
        <tr>
          <td align="left">good </td>
          <td>47-56 </td>
          <td>45-52 </td>
          <td>38-45 </td>
          <td>34-40 </td>
          <td>32-37 </td>
          <td>28-32 </td>
        </tr>
        <tr>
          <td align="left">above average </td>
          <td>42-46 </td>
          <td>39-44 </td>
          <td>34-37 </td>
          <td>31-33 </td>
          <td>28-31 </td>
          <td>25-27 </td>
        </tr>
        <tr>
          <td align="left">average </td>
          <td>38-41 </td>
          <td>35-38 </td>
          <td>31-33 </td>
          <td>28-30 </td>
          <td>25-27 </td>
          <td>22-24 </td>
        </tr>
        <tr>
          <td align="left">below average </td>
          <td>33-37 </td>
          <td>31-34 </td>
          <td>27-30 </td>
          <td>25-27 </td>
          <td>22-24 </td>
          <td>19-21 </td>
        </tr>
        <tr>
          <td align="left">poor </td>
          <td>28-32 </td>
          <td>26-30 </td>
          <td>22-26 </td>
          <td>20-24 </td>
          <td>18-21 </td>
          <td>17-18 </td>
        </tr>
        <tr>
          <td align="left">very poor </td>
          <td>&lt; 28 </td>
          <td>&lt; 26 </td>
          <td>&lt; 22 </td>
          <td>&lt; 20 </td>
          <td>&lt; 18 </td>
          <td>&lt; 17 </td>
        </tr>
      </tbody></table>
