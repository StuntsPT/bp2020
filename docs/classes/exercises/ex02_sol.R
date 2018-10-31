## Possible solutions for class 02 exercises (https://stuntspt.gitlab.io/bp2018/classes/exercises/ex02.html)

## 1. Data Structures

scratch_df = data.frame(c1=c(1,1,1,1), c2=c(2,2,2,2), c3=c(3,3,3,3))
rownames(scratch_df) = c("r1", "r2", "r3", "r4")

## 2. Diatoms data

diatoms_data = read.csv("../diatoms_data.csv", header=TRUE, row.names=2, sep=",")
diatoms_data["CC1", "Species.richness"]
diatoms_data[,"pH"]
diatoms_data["DC1",]
diatoms_data[diatoms_data$River.name == "Snake River", ]

## 3. Online data

pokedata = read.csv("https://gitlab.com/StuntsPT/bp2018/raw/master/docs/classes/exercises/poke_data.csv", header=TRUE, sep="\t")

max_hp = max(pokedata[,"HP"])

max_hp_pokemon = pokedata[pokedata$HP == max_hp, ]$Name

table(pokedata$Type.1)

table(pokedata[pokedata$Generation == 1, ]$Type.1)


water_type_pokemon = pokedata[pokedata$Type.1 == "Water" | pokedata$Type.2 == "Water", ]
max_sp_attack = max(water_type_pokemon$Sp..Attack)
max_sp_attack_water_pokemon = water_type_pokemon[water_type_pokemon$Sp..Attack == max_sp_attack, ]$Name
