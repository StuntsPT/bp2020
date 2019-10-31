## Blood Pressure
# 1.

bp_f = read.csv("https://docs.google.com/spreadsheet/pub?key=0ArfEDsV3bBwCdHBzUVVSMDlTX1ZCUnNJQ3ZFdkFXVFE&output=csv", header=TRUE, sep=",", row.names=1)
bp_m = read.csv("https://docs.google.com/spreadsheet/pub?key=0ArfEDsV3bBwCdHNwRm9DN1FnT3hXWWZVSncxMkZyS2c&output=csv", header=TRUE, sep=",", row.names=1)

colnames(bp_f) = sub("^X", "", colnames(bp_f))  # This will get rid of the "X" in the name
colnames(bp_m) = sub("^X", "", colnames(bp_m))

bp_f_1985_2005 = bp_f[,6:26]  # Get only the years 1985-2005
pt_f_values = as.numeric(bp_f_1985_2005["Portugal", ])
max_f_y = max(pt_f_values)
min_f_y = min(pt_f_values)

png(filename="/home/francisco/Bp_w_PT.png", height=900, width=900)  # The file path is set for *nix based operating systems

plot(pt_f_values, type="l", main="Blood pressure PT women 1985-2005", axes=FALSE, xlab="Years", ylab="Blood Pressure (mmHg)", ylim=c(floor(min_f_y), ceiling(max_f_y)))
axis(1, at=1:length(colnames(bp_f_1985_2005)), lab=colnames(bp_f_1985_2005))
axis(2, at=floor(min_f_y):ceiling((max_f_y + 1)), las=1)  # The +1 ensures everything is within the Y limits

def.off()

# 2.

pt_f_values = as.numeric(bp_f["Portugal", ])
pt_m_values = as.numeric(bp_m["Portugal", ])

max_y = max(c(pt_f_values, pt_m_values))
min_y = min(c(pt_f_values, pt_m_values))

png(filename="/home/francisco/Bp_wm_PT.png", height=900, width=900) 

plot(pt_f_values, type="l", main="Blood pressure PT 1980-2008", axes=FALSE, xlab="Years", ylab="Blood Pressure (mmHg)", col="violet", ylim=c(floor(min_y), ceiling(max_y)), lwd=4)
lines(pt_m_values, type="l", col="cyan", lwd=4)
axis(1, at=1:length(colnames(bp_f)), lab=colnames(bp_f))
axis(2, at=floor(min_y):(ceiling(max_y) + 1), las=1)

legend("topright", c("Women", "Men"),
       cex=0.8,
       col=c("violet", "cyan"), lwd=4)

dev.off()

# 3.

pt_f_values = as.numeric(bp_f["Portugal", ])
pt_m_values = as.numeric(bp_m["Portugal", ])
es_f_values = as.numeric(bp_f["Spain", ])
es_m_values = as.numeric(bp_m["Spain", ])

y_range = range(pt_f_values, pt_m_values, es_f_values, es_m_values)

png(filename="/home/francisco/Bp_wm_PT_vs_ES.png", height=900, width=900)

plot(pt_f_values, type="l", main="Blood pressure PT 1980-2008", axes=FALSE, xlab="Years", ylab="Blood Pressure (mmHg)", col="forestgreen", ylim=c(floor(y_range[1] - 1),ceiling(y_range[2])), lwd=4)
lines(pt_m_values, type="l", col="forestgreen", lwd=4, lty=2)
lines(es_f_values, type="l", col="yellow", lwd=4, lty=1)
lines(es_m_values, type="l", col="yellow", lwd=4, lty=2)

axis(1, at=1:length(colnames(bp_f)), lab=colnames(bp_f))
axis(2, at=floor(y_range[1] - 1):ceiling(y_range[2]) + 1, las=1)

legend("topright", c("PT ♀", "PT ♂ ", "ES ♀", "ES ♂ "),
       cex=0.8,
       col=c("forestgreen", "forestgreen", "yellow", "yellow"),
       lwd=4, lty=c(1, 2, 1, 2))

dev.off()

# 4.

male_subset = bp_m[c("China", "Canada", "Finland", "Greece"), c("1980","1990","2000")]  # Use lines and columns indexing
female_subset = bp_f[c("China", "Canada", "Finland", "Greece"), c("1980","1990","2000")]

country_colours = c("darkred", "red", "white", "cyan")  # Set colours outside

png(filename="/home/francisco/Bp_barplots.png", height=900, width=1300)

par(mfrow=c(1,2), xpd=T, mar=par()$mar+c(0,0,0,4))

barplot(as.matrix(male_subset), main="♂ blood pressure levels",
        col=country_colours, beside=TRUE, xlab="Years",
        ylab="Blood pressure  (mmHg)", las=1,
        ylim=c(0, max(male_subset) + max(male_subset, female_subset) * 0.1))

legend(15.5, 120, c("China", "Canada", "Finland", "Greece"),
       cex=1,
       fill=country_colours)

barplot(as.matrix(female_subset), main="♀ blood pressure levels",
        col=country_colours, beside=TRUE, xlab="Years",
        ylab="Blood pressure  (mmHg)", las=1,
        ylim=c(0, max(male_subset, female_subset) * 1.1))

dev.off()

## Pokedata Pt. 2
# 1.
pokedata = read.csv("https://gitlab.com/StuntsPT/bp2019/raw/master/docs/classes/exercises/poke_data.csv", header=TRUE, sep="\t")

max_hp = as.numeric(max(pokedata$HP))

png(filename="/home/francisco/HP_hist.png", height=1000, width=1000)

hist(pokedata$HP, xlab="HP", main="Histogram of Pokemon HP", col="red", axes=FALSE, ylim=c(0,300), las=1)
axis(1, at=seq(0, max_hp + 5, by=20))
axis(2, at=seq(0, 300, 30))

dev.off()

max_sp_def = max(pokedata$Sp.Defense)

png(filename="/home/francisco/Sp.def_hist.png", height=1000, width=1000)

hist(pokedata$Sp.Defense, xlab="Special Defense",
     main="Histogram of Pokemon Sp. Defense",
     col="gold", axes=FALSE,
     xlim=c(0, max_sp_def + 50),
     ylim=c(0,250),
     las=1)
axis(1, at=seq(0, max_sp_def + 50, by=20))
axis(2, at=seq(0, 250, by=50))

dev.off()

max_speed = max(pokedata$Speed)

png(filename="/home/francisco/Speed_hist.png", height=1000, width=1000)

hist(pokedata$Speed, xlab="Speed",
     main="Histogram of Pokemon Speed",
     col="orange",
     xlim=c(0, max_speed + 50),
     ylim=c(0,250),
     las=1)

dev.off()

# 2.

png(filename="/home/francisco/HP_vs_Defense.png", height=1000, width=1200)

plot(x=pokedata$Sp.Defense, y=pokedata$Defense, pch="x", col="blue", xlab="Sp. Defense",
     ylab="Defense", main="Pokemon Special Defense Vs. Defense",
     las=1)

dev.off()

png(filename="/home/francisco/HP_vs_Sp_Defense.png", height=1000, width=1200)

plot(x=pokedata$Sp.Attack, y=pokedata$Attack, pch="x", col="darkgreen", xlab="Sp. Attack",
     ylab="Attack", main="Pokemon Special Attack Vs. Attack",
     las=1)

dev.off()

# 3.

fire_sp_attack = pokedata[pokedata$Type1 == "Fire" | pokedata$Type2 == "Fire", "Sp.Attack"]
water_sp_attack = pokedata[pokedata$Type1 == "Water" | pokedata$Type2 == "Water", "Sp.Attack"]
electric_sp_attack = pokedata[pokedata$Type1 == "Electric" | pokedata$Type2 == "Electric", "Sp.Attack"]
ice_sp_attack = pokedata[pokedata$Type1 == "Ice" | pokedata$Type2 == "Ice", "Sp.Attack"]
grass_sp_attack = pokedata[pokedata$Type1 == "Grass" | pokedata$Type2 == "Grass", "Sp.Attack"]

png(filename="/home/francisco/Sp.Attack_by_type.png", height=1000, width=1200)

boxplot(fire_sp_attack, water_sp_attack, electric_sp_attack, ice_sp_attack, grass_sp_attack,
        ylab="Sp. Attack", xlab="Pokemon type",
        col=c("red", "lightblue", "gold", "white", "forestgreen"),
        main="Pokemon Sp. Attack by type", axes=FALSE, notch=TRUE,
        ylim=c(0,max(fire_sp_attack, water_sp_attack, electric_sp_attack, ice_sp_attack, grass_sp_attack)))
axis(1, at=1:5, labels=c("Fire", "Water", "Electric", "Ice", "Grass"))
axis(2,
     at=seq(0, max(fire_sp_attack, water_sp_attack, electric_sp_attack, ice_sp_attack, grass_sp_attack), by=20),
     las=1)
box()

dev.off()

# 4.

png(filename="/home/francisco/Sp.Attack_by_type.png", height=2000, width=2400)

par(mfrow=c(2,2))

fire_sp_attack = pokedata[pokedata$Type1 == "Fire" | pokedata$Type2 == "Fire", "Sp.Attack"]
water_sp_attack = pokedata[pokedata$Type1 == "Water" | pokedata$Type2 == "Water", "Sp.Attack"]
electric_sp_attack = pokedata[pokedata$Type1 == "Electric" | pokedata$Type2 == "Electric", "Sp.Attack"]
ice_sp_attack = pokedata[pokedata$Type1 == "Ice" | pokedata$Type2 == "Ice", "Sp.Attack"]
grass_sp_attack = pokedata[pokedata$Type1 == "Grass" | pokedata$Type2 == "Grass", "Sp.Attack"]

boxplot(fire_sp_attack, water_sp_attack, electric_sp_attack, ice_sp_attack, grass_sp_attack,
        ylab="Sp. Attack", xlab="Pokemon type",
        col=c("red", "lightblue", "gold", "white", "forestgreen"),
        main="Pokemon Sp. Attack by type", axes=FALSE, notch=TRUE)
axis(1, at=1:5, labels=c("Fire", "Water", "Electric", "Ice", "Grass"))
axis(2, at=seq(0, max(fire_sp_attack, water_sp_attack, electric_sp_attack, ice_sp_attack, grass_sp_attack), by=20))
box()

fire_sp_def = pokedata[pokedata$Type1 == "Fire" | pokedata$Type2 == "Fire", "Sp.Defense"]
water_sp_def = pokedata[pokedata$Type1 == "Water" | pokedata$Type2 == "Water", "Sp.Defense"]
electric_sp_def = pokedata[pokedata$Type1 == "Electric" | pokedata$Type2 == "Electric", "Sp.Defense"]
ice_sp_def = pokedata[pokedata$Type1 == "Ice" | pokedata$Type2 == "Ice", "Sp.Defense"]
grass_sp_def = pokedata[pokedata$Type1 == "Grass" | pokedata$Type2 == "Grass", "Sp.Defense"]

boxplot(fire_sp_def, water_sp_def, electric_sp_def, ice_sp_def, grass_sp_def,
        ylab="Sp. Defense", xlab="Pokemon type",
        col=c("red", "lightblue", "gold", "white", "forestgreen"),
        main="Pokemon Sp. Defense by type", axes=FALSE, notch=TRUE)
axis(1, at=1:5, labels=c("Fire", "Water", "Electric", "Ice", "Grass"))
axis(2, at=seq(0, max(fire_sp_def, water_sp_def, electric_sp_def, ice_sp_def, grass_sp_def), by=20))
box()

fire_speed = pokedata[pokedata$Type1 == "Fire" | pokedata$Type2 == "Fire", "Speed"]
water_speed = pokedata[pokedata$Type1 == "Water" | pokedata$Type2 == "Water", "Speed"]
electric_speed = pokedata[pokedata$Type1 == "Electric" | pokedata$Type2 == "Electric", "Speed"]
ice_speed = pokedata[pokedata$Type1 == "Ice" | pokedata$Type2 == "Ice", "Speed"]
grass_speed = pokedata[pokedata$Type1 == "Grass" | pokedata$Type2 == "Grass", "Speed"]

boxplot(fire_speed, water_speed, electric_speed, ice_speed, grass_speed,
        ylab="Speed", xlab="Pokemon type",
        col=c("red", "lightblue", "gold", "white", "forestgreen"),
        main="Pokemon Speed by type", axes=FALSE, notch=TRUE)
axis(1, at=1:5, labels=c("Fire", "Water", "Electric", "Ice", "Grass"))
axis(2, at=seq(0, max(fire_speed, water_speed, electric_speed, ice_speed, grass_speed), by=20))
box()

fire_hp = pokedata[pokedata$Type1 == "Fire" | pokedata$Type2 == "Fire", "HP"]
water_hp = pokedata[pokedata$Type1 == "Water" | pokedata$Type2 == "Water", "HP"]
electric_hp = pokedata[pokedata$Type1 == "Electric" | pokedata$Type2 == "Electric", "HP"]
ice_hp = pokedata[pokedata$Type1 == "Ice" | pokedata$Type2 == "Ice", "HP"]
grass_hp = pokedata[pokedata$Type1 == "Grass" | pokedata$Type2 == "Grass", "HP"]

boxplot(fire_hp, water_hp, electric_hp, ice_hp, grass_hp,
        ylab="HP", xlab="Pokemon type",
        col=c("red", "lightblue", "gold", "white", "forestgreen"),
        main="Pokemon HP by type", axes=FALSE, notch=TRUE)
axis(1, at=1:5, labels=c("Fire", "Water", "Electric", "Ice", "Grass"))
axis(2, at=seq(0, max(fire_hp, water_hp, electric_hp, ice_hp, grass_hp), by=20))
box()

dev.off()