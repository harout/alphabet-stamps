letters=( ա բ գ դ ե զ է ը թ ժ ի լ խ ծ կ հ ձ ղ ճ մ յ ն շ ո չ պ ջ ռ ս վ տ ր ց ւ փ ք օ ֆ)
 
for letter in "${letters[@]}"
do
  echo "${letter}"
  /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD  -o "${letter}".stl -D "letter=\""${letter}"\"" letter_mold.scad
done
