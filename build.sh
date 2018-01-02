mkdir -p tmp/sources/ukol_01
mkdir -p tmp/sources/ukol_02
mkdir -p tmp/sources/ukol_03
mkdir -p tmp/sources/ukol_05
mkdir -p tmp/sources/ukol_06
mkdir -p tmp/sources/ukol_07
mkdir -p tmp/sources/ukol_08
mkdir -p tmp/sources/ukol_10
mkdir -p tmp/sources/ukol_12

cd ukol_01/paper
make
mv *.pdf ../../tmp/
make clean
cd ../src/
cp *.m ../../tmp/sources/ukol_01/
cp *.wav ../../tmp/sources/ukol_01/
cd ../..

cd ukol_02/paper
make
mv *.pdf ../../tmp/
make clean
cd ../src/
cp *.m ../../tmp/sources/ukol_02/
cp *.wav ../../tmp/sources/ukol_02/
cd ../..

cd ukol_03/paper
make
mv *.pdf ../../tmp/
make clean
cd ../src/
cp *.m ../../tmp/sources/ukol_03/
cp *.wav ../../tmp/sources/ukol_03/
cd ../..

cd ukol_05/paper
make
mv *.pdf ../../tmp/
make clean
cd ../src/
cp *.m ../../tmp/sources/ukol_05/
cp *.wav ../../tmp/sources/ukol_05/
cd ../..

cd ukol_06/paper
make
mv *.pdf ../../tmp/
make clean
cd ../src/
cp *.m ../../tmp/sources/ukol_06/
cp *.wav ../../tmp/sources/ukol_06/
cd ../..

cd ukol_07/paper
make
mv *.pdf ../../tmp/
make clean
cd ../src/
cp *.m ../../tmp/sources/ukol_07/
cp *.wav ../../tmp/sources/ukol_07/
cd ../..

cd ukol_08/paper
make
mv *.pdf ../../tmp/
make clean
cd ../src/
cp *.m ../../tmp/sources/ukol_08/
cp *.wav ../../tmp/sources/ukol_08/
cd ../..

cd ukol_10/paper
make
mv *.pdf ../../tmp/
make clean
cd ../src/
cp *.m ../../tmp/sources/ukol_10/
cp *.wav ../../tmp/sources/ukol_10/
cd ../..

cd ukol_12/paper
make
mv *.pdf ../../tmp/
make clean
cd ../src/
cp *.m ../../tmp/sources/ukol_12/
cp *.wav ../../tmp/sources/ukol_12/
cd ../..

cd tmp/
rar a IDIZE_Mlejnecky.rar *.pdf sources
mv IDIZE_Mlejnecky.rar ..
cd ..
rm -rf tmp
