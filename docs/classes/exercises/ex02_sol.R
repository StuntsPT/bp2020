## Possible solutions for class 02 exercises (https://stuntspt.gitlab.io/bp2019/classes/exercises/ex02.html)

## 1. Data Structures

scratch_df = data.frame(c1=c(1,1,1,1), c2=c(2,2,2,2), c3=c(3,3,3,3))
rownames(scratch_df) = c("r1", "r2", "r3", "r4")

## 2. Diatoms data

diatoms_data = read.csv("../diatoms_data.csv", header=TRUE, row.names=2, sep=",")
diatoms_data["CC1", "Species.richness"]
diatoms_data[,"Diversity"]
diatoms_data["DC1",]
diatoms_data[diatoms_data$River.name == "Snake River", ]

## 3. Online data

# 3.1
pokedata = read.csv("https://gitlab.com/StuntsPT/bp2019/raw/master/docs/classes/exercises/poke_data.csv", header=TRUE, sep="\t", row.names=2)

# 3.2
View(pokedata)

# 3.3
min_hp = min(pokedata[,"HP"])
min_hp_pokemon = row.names(pokedata[pokedata[, "HP"] == min_hp, ])

max_hp = max(pokedata[,"HP"])
max_hp_pokemon = row.names(pokedata[pokedata[, "HP"] == max_hp, ])

# 3.4
table(pokedata$Type.1)

table(pokedata[pokedata$Generation == 1, "Type1"])

# 3.5
water_type_pokemon = pokedata[pokedata[,"Type1"] == "Water" | pokedata[,"Type2"] == "Water", ]
max_sp_attack = max(water_type_pokemon[, "Sp.Attack"])
max_sp_attack_water_pokemon = row.names(water_type_pokemon[water_type_pokemon[, "Sp.Attack"] == max_sp_attack, ])
