make clean
csub -j8 make -j32 -C $GITTOP
CBCORE_IMAGES=cbcore make cbcore STRIPFILES=true; make cbcore-mksingularity
