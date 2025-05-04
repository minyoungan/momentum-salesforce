Content Starts HereContent Starts Here
« Back to Inbound Change Set: RegistrationQueueable Feature
Apex Class
RegistrationQueueable
Video Tutorial | Help for this Page
Apex Class Source
 
Component Name	RegistrationQueueable	Change Set Name	RegistrationQueueable Feature
API Name	RegistrationQueueable	Change Set Status	Failed
Type	Apex Class	Uploaded On	04/05/2025 1:49 PM
	
	
Source


1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210
211
212
213
214
215
216
217
218
219
220
221
222
223
224
225
226
227
228
229
230
231
232
233
234
235
236
237
238
239
240
241
242
243
244
245
246
247
248
249
250
251
252
253
254
255
256
257
258
259
260
261
262
263
264
265
266
267
268
269
270
271
272
273
274
275
276
277
278
public class RegistrationQueueable implements Queueable {
    private Registration__c registrationRecord;
    
    // Constructor to accept a Registration__c record
    public RegistrationQueueable(Registration__c reg) {
        this.registrationRecord = reg;
    }
    
    // Queueable interface method
    public void execute(QueueableContext context) {
        System.debug('##### Processing queued job for record Id: ' + registrationRecord.Id);
        
        // Get the session type and preferred language
        System.debug('##### Session Type: ' + registrationRecord.Session__r);
        System.debug('##### User Language: ' + registrationRecord.Contact__r);
        System.debug('##### User Language: ' + registrationRecord.User_Language__c);

        System.debug('##### MC_Online_Men_Confirmation_EN__c value: ' + registrationRecord.MC_Online_Men_Confirmation_EN__c);

        if (registrationRecord.MC_Online_Men_Confirmation_EN__c) {
            System.debug('##### Executing automateByName for Online Men Confirmation EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Men Confirmation EN');
        }

        System.debug('##### Queued job completed for record Id: ' + registrationRecord.Id);
        
        System.debug('##### Enqueuing job for record Id: ' + registrationRecord.Id);
        System.debug('##### User Language: ' + registrationRecord.User_Language__c);
    /*
        
        if (registrationRecord.Status__c == 'Pending validation') {
            System.debug('##### Executing automateByName for Registration Status - Pending Validation FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Registration Status Pending FR');
        }
        if (registrationRecord.Status__c == 'Cancelled') {
            System.debug('##### Executing automateByName for Registration Status - Cancelled FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Registration Status Cancelled FR');
        }
        if (registrationRecord.Status__c == 'Attended') {
            System.debug('##### Executing automateByName for Registration Status - Attended FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Registration Status Attended FR');
        }
        if (registrationRecord.Status__c == 'No Show') {
            System.debug('##### Executing automateByName for Registration Status - No Show FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Registration Status NoShow FR');
        }

        // Online Nutrition Events (EN)
        if (registrationRecord.MC_Online_Nutrition_Attended_EN__c) {
            System.debug('##### Executing automateByName for Online Nutrition Attended EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Nutrition Attended EN');
        }
        if (registrationRecord.MC_Online_Nutrition_Confirmation_EN__c) {
            System.debug('##### Executing automateByName for Online Nutrition Confirmation EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Nutrition Confirmation EN');
        }
        if (registrationRecord.MC_Online_Nutrition_Reminder_EN__c) {
            System.debug('##### Executing automateByName for Online Nutrition Reminder EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Nutrition Reminder EN');
        }

        // Online Teens Events (EN)
        if (registrationRecord.MC_Online_Teens_Attended_EN__c) {
            System.debug('##### Executing automateByName for Online Teens Attended EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Teen Attended EN');
        }
        if (registrationRecord.MC_Online_Teens_Confirmation_EN__c) {
            System.debug('##### Executing automateByName for Online Teens Confirmation EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Teen Confirmation EN');
        }
        if (registrationRecord.MC_Online_Teens_Reminder_EN__c) {
            System.debug('##### Executing automateByName for Online Teens Reminder EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Teen Reminder EN');
        }

        // Online Men Events (EN)
        if (registrationRecord.MC_Online_Men_Attended_EN__c) {
            System.debug('##### Executing automateByName for Online Men Attended EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Men Attended EN');
        }
        if (registrationRecord.MC_Online_Men_Confirmation_EN__c) {
            System.debug('##### Executing automateByName for Online Men Confirmation EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Men Confirmation EN');
        }
        if (registrationRecord.MC_Online_Men_No_Show_EN__c) {
            System.debug('##### Executing automateByName for Online Men No Show EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Men No Show EN');
        }
        if (registrationRecord.MC_Online_Men_Reminder_EN__c) {
            System.debug('##### Executing automateByName for Online Men Reminder EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Men Reminder EN');
        }

        // Online Breastcare Events (EN)
        if (registrationRecord.MC_Online_Breastcare_Attended_EN__c) {
            System.debug('##### Executing automateByName for Online Breastcare Attended EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Breast Prostheses Attended EN');
        }
        if (registrationRecord.MC_Online_Breastcare_Confirmation_EN__c) {
            System.debug('##### Executing automateByName for Online Breastcare Confirmation EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Breast Prostheses Confirmation EN');
        }
        if (registrationRecord.MC_Online_Breastcare_No_Show_EN__c) {
            System.debug('##### Executing automateByName for Online Breastcare No Show EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Breast Prostheses No Show EN');
        }
        if (registrationRecord.MC_Online_Breastcare_Reminder_EN__c) {
            System.debug('##### Executing automateByName for Online Breastcare Reminder EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Breast Prostheses Reminder EN');
        }

        // Online Wigs Events (EN)
        if (registrationRecord.MC_Online_Wigs_Attended_EN__c) {
            System.debug('##### Executing automateByName for Online Wigs Attended EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Wigs and Hair Alternatives Attended EN');
        }
        if (registrationRecord.MC_Online_Wigs_Confirmation_EN__c) {
            System.debug('##### Executing automateByName for Online Wigs Confirmation EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Wigs and Hair Alternatives Confirmation EN');
        }
        if (registrationRecord.MC_Online_Wigs_No_Show_EN__c) {
            System.debug('##### Executing automateByName for Online Wigs No Show EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Wigs and Hair Alternatives No Show EN');
        }
        if (registrationRecord.MC_Online_Wigs_Reminder_EN__c) {
            System.debug('##### Executing automateByName for Online Wigs Reminder EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Wigs and Hair Alternatives Reminder EN');
        }

        // Online Skincare Events (EN)
        if (registrationRecord.MC_Online_Skincare_Attended_EN__c) {
            System.debug('##### Executing automateByName for Online Skincare Attended EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Skincare and Cosmetics Attended EN');
        }
        if (registrationRecord.MC_Online_Skincare_Confirmation_EN__c) {
            System.debug('##### Executing automateByName for Online Skincare Confirmation EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Skincare and Cosmetics Confirmation EN');
        }
        if (registrationRecord.MC_Online_Skincare_No_Show_EN__c) {
            System.debug('##### Executing automateByName for Online Skincare No Show EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Skincare and Cosmetics No Show EN');
        }
        if (registrationRecord.MC_Online_Skincare_Reminder_EN__c) {
            System.debug('##### Executing automateByName for Online Skincare Reminder EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Skincare and Cosmetics Reminder EN');
        }

        // In-Person Events (EN)
        if (registrationRecord.MC_In_Person_Attended_EN__c) {
            System.debug('##### Executing automateByName for In-Person Attended EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS In-Person Attended EN');
        }
        if (registrationRecord.MC_In_Person_Confirmation_EN__c) {
            System.debug('##### Executing automateByName for In-Person Confirmation EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS In-Person Confirmation EN');
        }
        if (registrationRecord.MC_In_Person_Follow_Up_EN__c) {
            System.debug('##### Executing automateByName for In-Person Follow Up EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS In-Person Follow Up EN');
        }
        if (registrationRecord.MC_In_Person_No_Show_EN__c) {
            System.debug('##### Executing automateByName for In-Person No Show EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS In-Person No Show EN');
        }
        if (registrationRecord.MC_In_Person_Reminder_EN__c) {
            System.debug('##### Executing automateByName for In-Person Reminder EN');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS In-Person Reminder EN');
        }

        // Online Nutrition Events (FR)
        if (registrationRecord.MC_Online_Nutrition_Attended_FR__c) {
            System.debug('##### Executing automateByName for Online Nutrition Attended FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Nutrition Attended FR');
        }
        if (registrationRecord.MC_Online_Nutrition_Confirmation_FR__c) {
            System.debug('##### Executing automateByName for Online Nutrition Confirmation FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Nutrition Confirmation FR');
        }
        if (registrationRecord.MC_Online_Nutrition_Reminder_FR__c) {
            System.debug('##### Executing automateByName for Online Nutrition Reminder FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Nutrition Reminder FR');
        }

        // Online Men Events (FR)
        if (registrationRecord.MC_Online_Men_Attended_FR__c) {
            System.debug('##### Executing automateByName for Online Men Attended FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Men Attended FR');
        }
        if (registrationRecord.MC_Online_Men_Confirmation_FR__c) {
            System.debug('##### Executing automateByName for Online Men Confirmation FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Men Confirmation FR');
        }
        if (registrationRecord.MC_Online_Men_No_Show_FR__c) {
            System.debug('##### Executing automateByName for Online Men No Show FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Men No Show FR');
        }
        if (registrationRecord.MC_Online_Men_Reminder_FR__c) {
            System.debug('##### Executing automateByName for Online Men Reminder FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Men Reminder FR');
        }

        // Online Breastcare Events (FR)
        if (registrationRecord.MC_Online_Breastcare_Attended_FR__c) {
            System.debug('##### Executing automateByName for Online Breastcare Attended FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Breast Prostheses Attended FR');
        }
        if (registrationRecord.MC_Online_Breastcare_Confirmation_FR__c) {
            System.debug('##### Executing automateByName for Online Breastcare Confirmation FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Breast Prostheses Confirmation FR');
        }
        if (registrationRecord.MC_Online_Breastcare_No_Show_FR__c) {
            System.debug('##### Executing automateByName for Online Breastcare No Show FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Breast Prostheses No Show FR');
        }
        if (registrationRecord.MC_Online_Breastcare_Reminder_FR__c) {
            System.debug('##### Executing automateByName for Online Breastcare Reminder FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Breast Prostheses Reminder FR');
        }

        // Online Wigs Events (FR)
        if (registrationRecord.MC_Online_Wigs_Attended_FR__c) {
            System.debug('##### Executing automateByName for Online Wigs Attended FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Wigs and Hair Alternatives Attended FR');
        }
        if (registrationRecord.MC_Online_Wigs_Confirmation_FR__c) {
            System.debug('##### Executing automateByName for Online Wigs Confirmation FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Wigs and Hair Alternatives Confirmation FR');
        }
        if (registrationRecord.MC_Online_Wigs_No_Show_FR__c) {
            System.debug('##### Executing automateByName for Online Wigs No Show FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Wigs and Hair Alternatives No Show FR');
        }
        if (registrationRecord.MC_Online_Wigs_Reminder_FR__c) {
            System.debug('##### Executing automateByName for Online Wigs Reminder FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Wigs and Hair Alternatives Reminder FR');
        }

        // Online Skincare Events (FR)
        if (registrationRecord.MC_Online_Skincare_Attended_FR__c) {
            System.debug('##### Executing automateByName for Online Skincare Attended FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Skincare and Cosmetics Attended FR');
        }
        if (registrationRecord.MC_Online_Skincare_Confirmation_FR__c) {
            System.debug('##### Executing automateByName for Online Skincare Confirmation FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Skincare and Cosmetics Confirmation FR');
        }
        if (registrationRecord.MC_Online_Skincare_No_Show_FR__c) {
            System.debug('##### Executing automateByName for Online Skincare No Show FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Skincare and Cosmetics No Show FR');
        }
        if (registrationRecord.MC_Online_Skincare_Reminder_FR__c) {
            System.debug('##### Executing automateByName for Online Skincare Reminder FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS Skincare and Cosmetics Reminder FR');
        }

        // In-Person Events (FR)
        if (registrationRecord.MC_In_Person_Attended_FR__c) {
            System.debug('##### Executing automateByName for In-Person Attended FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS In-Person Attended FR');
        }
        if (registrationRecord.MC_In_Person_Confirmation_FR__c) {
            System.debug('##### Executing automateByName for In-Person Confirmation FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS In-Person Confirmation FR');
        }
        if (registrationRecord.MC_In_Person_Follow_Up_FR__c) {
            System.debug('##### Executing automateByName for In-Person Follow Up FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS In-Person Follow Up FR');
        }
        if (registrationRecord.MC_In_Person_No_Show_FR__c) {
            System.debug('##### Executing automateByName for In-Person No Show FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS In-Person No Show FR');
        }
        if (registrationRecord.MC_In_Person_Reminder_FR__c) {
            System.debug('##### Executing automateByName for In-Person Reminder FR');
            et4ae5.triggerUtility.automateByName('Registration__c', 'TS In-Person Reminder FR');
        }*/
    }
}

                                    

