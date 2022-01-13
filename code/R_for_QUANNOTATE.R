library(survival)
library(ggplot2)
library(survminer)
library(rms)

npc<-read.csv("/data/QUANNOTATE_data2.csv")
npc <- as.data.frame(npc)

dd <- datadist(npc); options(datadist='dd')

## For TTLF
# Kaplan-Meier - Age
fit<-survfit(Surv(TTLF,TTLF_event)~Age_54_and_older, data=npc)

ggsurvplot(fit, legend.title="Age",legend.labs=c("Age<=53","Age>53"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Age
survdiff(Surv(TTLF,TTLF_event)~Age_54_and_older,data=npc)


# Kaplan-Meier - Gender
fit<-survfit(Surv(TTLF,TTLF_event)~Female, data=npc)

ggsurvplot(fit, legend.title="Gender",legend.labs=c("Male","Female"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Gender
survdiff(Surv(TTLF,TTLF_event)~Female,data=npc)


# Kaplan-Meier - Performance
fit<-survfit(Surv(TTLF,TTLF_event)~ECOG1_3,data=npc)

ggsurvplot(fit, legend.title="ECOG Performance",legend.labs=c("ECOG=0","ECOG 1-3"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Performance
survdiff(Surv(TTLF,TTLF_event)~ECOG1_3,data=npc)


# Kaplan-Meier - Smoking Hx
fit<-survfit(Surv(TTLF,TTLF_event)~Smoker,data=npc)

ggsurvplot(fit, legend.title="Smoking Hx",legend.labs=c("Non-smoker","Smoker"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Smoking Hx
survdiff(Surv(TTLF,TTLF_event)~Smoker,data=npc)


# Kaplan-Meier - Alcohol Hx
fit<-survfit(Surv(TTLF,TTLF_event)~Drinker,data=npc)

ggsurvplot(fit, legend.title="Alcohol Hx",legend.labs=c("Non-drinker","Drinker"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Alcohol Hx
survdiff(Surv(TTLF,TTLF_event)~Drinker,data=npc)


# Kaplan-Meier - EBV
fit<-survfit(Surv(TTLF,TTLF_event)~EBV_negative,data=npc)

ggsurvplot(fit, legend.title="EBV",legend.labs=c("EBV(+)","EBV(-)"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - EBV
survdiff(Surv(TTLF,TTLF_event)~EBV_negative,data=npc)



# Kaplan-Meier - Pathology
fit<-survfit(Surv(TTLF,TTLF_event)~WHO_I_IIa,data=npc)

ggsurvplot(fit, legend.title="Pathology",legend.labs=c("WHO IIb","WHO I-IIa"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Pathology
survdiff(Surv(TTLF,TTLF_event)~WHO_I_IIa,data=npc)


# Kaplan-Meier - T stage
fit<-survfit(Surv(TTLF,TTLF_event)~T4,data=npc)

ggsurvplot(fit, legend.title="T stage",legend.labs=c("T1-3","T4"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - T stage
survdiff(Surv(TTLF,TTLF_event)~T4,data=npc)


# Kaplan-Meier - Treatment
fit<-survfit(Surv(TTLF,TTLF_event)~RT_alone,data=npc)

ggsurvplot(fit, legend.title="Treatment",legend.labs=c("CCRT","RT alone"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Treatment
survdiff(Surv(TTLF,TTLF_event)~RT_alone,data=npc)


# Kaplan-Meier - Compliance
fit<-survfit(Surv(TTLF,TTLF_event)~Score_17_or_less,data=npc)

ggsurvplot(fit, legend.title="Guideline compliance",legend.labs=c("Score 18","Score <18"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Compliance
survdiff(Surv(TTLF,TTLF_event)~Score_17_or_less,data=npc)


# Kaplan-Meier - Petrous apex
fit<-survfit(Surv(TTLF,TTLF_event)~PA_inadequate,data=npc)

ggsurvplot(fit, legend.title="Petrous apex",legend.labs=c("Conforming","Nonconforming"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Petrous apex
survdiff(Surv(TTLF,TTLF_event)~PA_inadequate,data=npc)
         

# Kaplan-Meier - Cavernous sinus
fit<-survfit(Surv(TTLF,TTLF_event)~CS_inadequate,data=npc)

ggsurvplot(fit, legend.title="Cavernous sinus",legend.labs=c("Conforming","Nonconforming"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Cavernous sinus
survdiff(Surv(TTLF,TTLF_event)~CS_inadequate,data=npc)


# Kaplan-Meier - Sphenoid sinus
fit<-survfit(Surv(TTLF,TTLF_event)~SS_inadequate,data=npc)

ggsurvplot(fit, legend.title="Sphenoid sinus",legend.labs=c("Conforming","Nonconforming"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Sphenoid sinus
survdiff(Surv(TTLF,TTLF_event)~SS_inadequate,data=npc)



# Multivariate analysis
cox_ttlf <- cph(Surv(TTLF, TTLF_event==1)~T4 + RT_alone + CS_inadequate, x = T, y = T, data = npc, surv = T)
cox_ttlf



## For OS
# Kaplan-Meier - Age
fit<-survfit(Surv(Length_FU,OS_event)~Age_54_and_older, data=npc)

ggsurvplot(fit, legend.title="Age",legend.labs=c("Age<=53","Age>53"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Age
survdiff(Surv(Length_FU,OS_event)~Age_54_and_older,data=npc)


# Kaplan-Meier - Gender
fit<-survfit(Surv(Length_FU,OS_event)~Female, data=npc)

ggsurvplot(fit, legend.title="Gender",legend.labs=c("Male","Female"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Gender
survdiff(Surv(Length_FU,OS_event)~Female,data=npc)


# Kaplan-Meier - Performance
fit<-survfit(Surv(Length_FU,OS_event)~ECOG1_3,data=npc)

ggsurvplot(fit, legend.title="ECOG Performance",legend.labs=c("ECOG=0","ECOG 1-3"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Performance
survdiff(Surv(Length_FU,OS_event)~ECOG1_3,data=npc)


# Kaplan-Meier - Smoking Hx
fit<-survfit(Surv(Length_FU,OS_event)~Smoker,data=npc)

ggsurvplot(fit, legend.title="Smoking Hx",legend.labs=c("Non-smoker","Smoker"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Smoking Hx
survdiff(Surv(Length_FU,OS_event)~Smoker,data=npc)


# Kaplan-Meier - Alcohol Hx
fit<-survfit(Surv(Length_FU,OS_event)~Drinker,data=npc)

ggsurvplot(fit, legend.title="Alcohol Hx",legend.labs=c("Non-drinker","Drinker"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Alcohol Hx
survdiff(Surv(Length_FU,OS_event)~Drinker,data=npc)


# Kaplan-Meier - EBV
fit<-survfit(Surv(Length_FU,OS_event)~EBV_negative,data=npc)

ggsurvplot(fit, legend.title="EBV",legend.labs=c("EBV(+)","EBV(-)"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - EBV
survdiff(Surv(Length_FU,OS_event)~EBV_negative,data=npc)


# Kaplan-Meier - Pathology
fit<-survfit(Surv(Length_FU,OS_event)~WHO_I_IIa,data=npc)

ggsurvplot(fit, legend.title="Pathology",legend.labs=c("WHO IIb","WHO I-IIa"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Pathology
survdiff(Surv(Length_FU,OS_event)~WHO_I_IIa,data=npc)


# Kaplan-Meier - T stage
fit<-survfit(Surv(Length_FU,OS_event)~T4,data=npc)

ggsurvplot(fit, legend.title="T stage",legend.labs=c("T1-3","T4"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - T stage
survdiff(Surv(Length_FU,OS_event)~T4,data=npc)


# Kaplan-Meier - N stage
fit<-survfit(Surv(Length_FU,OS_event)~N3,data=npc)

ggsurvplot(fit, legend.title="N stage",legend.labs=c("N1-2","N3"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - N stage
survdiff(Surv(Length_FU,OS_event)~N3,data=npc)


# Kaplan-Meier - Treatment
fit<-survfit(Surv(Length_FU,OS_event)~RT_alone,data=npc)

ggsurvplot(fit, legend.title="Treatment",legend.labs=c("CCRT","RT alone"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Treatment
survdiff(Surv(Length_FU,OS_event)~RT_alone,data=npc)


# Kaplan-Meier - Compliance
fit<-survfit(Surv(Length_FU,OS_event)~Score_17_or_less,data=npc)

ggsurvplot(fit, legend.title="Guideline compliance",legend.labs=c("Score 18","Score <18"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Compliance
survdiff(Surv(Length_FU,OS_event)~Score_17_or_less,data=npc)


# Kaplan-Meier - Petrous apex
fit<-survfit(Surv(Length_FU,OS_event)~PA_inadequate,data=npc)

ggsurvplot(fit, legend.title="Petrous apex",legend.labs=c("Conforming","Nonconforming"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Petrous apex
survdiff(Surv(Length_FU,OS_event)~PA_inadequate,data=npc)


# Kaplan-Meier - Cavernous sinus
fit<-survfit(Surv(Length_FU,OS_event)~CS_inadequate,data=npc)

ggsurvplot(fit, legend.title="Cavernous sinus",legend.labs=c("Conforming","Nonconforming"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Cavernous sinus
survdiff(Surv(Length_FU,OS_event)~CS_inadequate,data=npc)


# Kaplan-Meier - Sphenoid sinus
fit<-survfit(Surv(Length_FU,OS_event)~SS_inadequate,data=npc)

ggsurvplot(fit, legend.title="Sphenoid sinus",legend.labs=c("Conforming","Nonconforming"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Sphenoid sinus
survdiff(Surv(Length_FU,OS_event)~SS_inadequate,data=npc)



# Multivariate analysis
cox_os <- cph(Surv(Length_FU,OS_event==1)~Age_54_and_older + ECOG1_3 + WHO_I_IIa + T4 + N3 + RT_alone + CS_inadequate, x = T, y = T, data = npc, surv = T)
cox_os



### For TTLF of T3-4 only
npc<-read.csv("/data/QUANNOTATE_data2_T34.csv")
npc <- as.data.frame(npc)

dd <- datadist(npc); options(datadist='dd')

## For TTLF
# Kaplan-Meier - Age
fit<-survfit(Surv(TTLF,TTLF_event)~Age_54_and_older, data=npc)

ggsurvplot(fit, legend.title="Age",legend.labs=c("Age<=53","Age>53"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Age
survdiff(Surv(TTLF,TTLF_event)~Age_54_and_older,data=npc)


# Kaplan-Meier - Gender
fit<-survfit(Surv(TTLF,TTLF_event)~Female, data=npc)

ggsurvplot(fit, legend.title="Gender",legend.labs=c("Male","Female"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Gender
survdiff(Surv(TTLF,TTLF_event)~Female,data=npc)


# Kaplan-Meier - Performance
fit<-survfit(Surv(TTLF,TTLF_event)~ECOG1_3,data=npc)

ggsurvplot(fit, legend.title="ECOG Performance",legend.labs=c("ECOG=0","ECOG 1-3"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Performance
survdiff(Surv(TTLF,TTLF_event)~ECOG1_3,data=npc)


# Kaplan-Meier - Smoking Hx
fit<-survfit(Surv(TTLF,TTLF_event)~Smoker,data=npc)

ggsurvplot(fit, legend.title="Smoking Hx",legend.labs=c("Non-smoker","Smoker"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Smoking Hx
survdiff(Surv(TTLF,TTLF_event)~Smoker,data=npc)


# Kaplan-Meier - Alcohol Hx
fit<-survfit(Surv(TTLF,TTLF_event)~Drinker,data=npc)

ggsurvplot(fit, legend.title="Alcohol Hx",legend.labs=c("Non-drinker","Drinker"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Alcohol Hx
survdiff(Surv(TTLF,TTLF_event)~Drinker,data=npc)


# Kaplan-Meier - EBV
fit<-survfit(Surv(TTLF,TTLF_event)~EBV_negative,data=npc)

ggsurvplot(fit, legend.title="EBV",legend.labs=c("EBV(+)","EBV(-)"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - EBV
survdiff(Surv(TTLF,TTLF_event)~EBV_negative,data=npc)


# Kaplan-Meier - Pathology
fit<-survfit(Surv(TTLF,TTLF_event)~WHO_I_IIa,data=npc)

ggsurvplot(fit, legend.title="Pathology",legend.labs=c("WHO IIb","WHO I-IIa"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Pathology
survdiff(Surv(TTLF,TTLF_event)~WHO_I_IIa,data=npc)


# Kaplan-Meier - T stage
fit<-survfit(Surv(TTLF,TTLF_event)~T4,data=npc)

ggsurvplot(fit, legend.title="T stage",legend.labs=c("T1-3","T4"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - T stage
survdiff(Surv(TTLF,TTLF_event)~T4,data=npc)


# Kaplan-Meier - Treatment
fit<-survfit(Surv(TTLF,TTLF_event)~RT_alone,data=npc)

ggsurvplot(fit, legend.title="Treatment",legend.labs=c("CCRT","RT alone"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Treatment
survdiff(Surv(TTLF,TTLF_event)~RT_alone,data=npc)


# Kaplan-Meier - Compliance
fit<-survfit(Surv(TTLF,TTLF_event)~Score_17_or_less,data=npc)

ggsurvplot(fit, legend.title="Guideline compliance",legend.labs=c("Score 18","Score <18"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Compliance
survdiff(Surv(TTLF,TTLF_event)~Score_17_or_less,data=npc)


# Kaplan-Meier - Petrous apex
fit<-survfit(Surv(TTLF,TTLF_event)~PA_inadequate,data=npc)

ggsurvplot(fit, legend.title="Petrous apex",legend.labs=c("Conforming","Nonconforming"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Petrous apex
survdiff(Surv(TTLF,TTLF_event)~PA_inadequate,data=npc)


# Kaplan-Meier - Cavernous sinus
fit<-survfit(Surv(TTLF,TTLF_event)~CS_inadequate,data=npc)

ggsurvplot(fit, legend.title="Cavernous sinus",legend.labs=c("Conforming","Nonconforming"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Cavernous sinus
survdiff(Surv(TTLF,TTLF_event)~CS_inadequate,data=npc)


# Kaplan-Meier - Sphenoid sinus
fit<-survfit(Surv(TTLF,TTLF_event)~SS_inadequate,data=npc)

ggsurvplot(fit, legend.title="Sphenoid sinus",legend.labs=c("Conforming","Nonconforming"),conf.int=T,pval=T,risk.table=T)

# Log-rank test - Sphenoid sinus
survdiff(Surv(TTLF,TTLF_event)~SS_inadequate,data=npc)



# Multivariate analysis
coxm <- cph(Surv(TTLF, TTLF_event==1)~Age_54_and_older + T4 + RT_alone + CS_inadequate, x = T, y = T, data = npc, surv = T)
coxm


