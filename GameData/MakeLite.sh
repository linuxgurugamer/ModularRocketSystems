#!/bin/bash
#
cat <<_EOF_
This script is used to copy over the cfg and img files neede
for the Lite release
_EOF_

#
cfgfiles="
FuelTank/NB0mtank1/mrs-tank-0625-lfo-1.cfg
Engine/NB2mNuclearEngine/mrs-eng-250-nuc.cfg
Engine/NB3mHoundEngine/mrs-eng-375-hound.cfg
Control/mrs-sas-375.cfg
CargoBays/mrs-bay-cargo-125.cfg
CargoBays/mrs-bay-cargo-250-short.cfg
CargoBays/mrs-bay-cargo-250-long.cfg
FuelTank/NBconeTank2m/mrs-tank-250-cone.cfg
FuelTank/NBconeTank3m/mrs-tank-375-cone.cfg
Coupling/mrs-decoup-250-lp.cfg
Coupling/mrs-decoup-radial-mini.cfg
Utility/mrs-dock-help-0625.cfg
Utility/mrs-dock-help-125.cfg
Utility/mrs-dock-help-250.cfg
Engine/mrs-flingatron.cfg
Electrical/mrs-fuelcell-125.cfg
Resource/mrs-drill-250.cfg
FuelTank/NBjumboThreeQ/mrs-tank-250-jumbo-075.cfg
Ground/mrs-leg-1.cfg
LAS/mrs-LAS-shroud.cfg
LAS/mrs-LAS-tower.cfg
FuelTank/NBmonoprop3m/mrs-eng-375-mono.cfg
Command/mrs-probe-radial-1.cfg
Command/mrs-probe-radial-2.cfg
FuelTank/NBradialMiniTank/mrs-tank-radial-mini.cfg
Control/mrs-rcs-5.cfg
Control/mrs-rcs-corner.cfg
Electrical/mrs-rtg-125.cfg
"

imgfiles="
cargoBay-Specular.dds
cargoBay1m-Specular.dds
bigASAS-Emissive.dds
bigASAS-Specular.dds
probeRadial-Emissive.dds
probeRadial-Specular.dds
2mNuclearEngine-Emissive.dds
2mNuclearEngine-Shroud-Specular.dds
2mNuclearEngine-Specular.dds
3mTerrierEngine-Emissive.dds
3mTerrierEngine-Specular.dds
NBfuelCell1m-Specular.dds
0mtank1-Specular.dds
coneTank2mSpecular.dds
coneTankSpecular.dds
jumboThreeQSpecular.dds
monoprop3mSpecular.dds
radialMiniTankSpecular.dds
LASshroud-Specular.dds
LAStower-Specular.dds
NBlandingLeg1-Specular.dds
rcsBlock-Specular.dds
NBrtg1-Specular.dds
NBinlineDrill-Specular.dds
resourceContainer_DIFF.dds
resourceContainer_NRM.dds
TriBitDrill.dds
decouplerLowProfile2mSpecular.dds
miniRadialDecouplerSpecular.dds
dockingHelper0Specular.dds
dockingHelperSpecular.dds
dockingHelper2Specular.dds
flingatronSpecular.dds
"

for i in $cfgfiles; do
	model=`grep 'model =' ModularRocketSystems/Parts/$i | grep -v '//' | grep -v Squad`
	if [ "$model" != "" ]; then
		echo $model
		m=`echo $model | cut -f3 -d' '`
		echo $m
		ls $m.mu
		d=`echo $m | sed 's/ModularRocketSystems/ModularRocketSystemsLite/'`
		echo $d
		cp $m.mu $d.mu
	fi
	sed  's/ModularRocketSystems/ModularRocketSystemsLite/' ModularRocketSystems/Parts/$i >ModularRocketSystemsLite/Parts/$i
done

for i in $imgfiles; do
	m=`find ModularRocketSystems -name $i -print`
	d=`echo $m | sed 's/ModularRocketSystems/ModularRocketSystemsLite/'`
	cp $m $d
done
