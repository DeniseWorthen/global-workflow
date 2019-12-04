USER=Judy.K.Henderson
PTMP=/scratch1/BMC/gsd-fv3-dev/NCEPDEV/stmp3/${USER}                 ## default PTMP directory
STMP=/scratch1/BMC/gsd-fv3-dev/NCEPDEV/stmp4/${USER}                 ## default STMP directory
GITDIR=/scratch1/BMC/gsd-fv3-dev/${USER}/test/gmtb_ccpp_hera        ## where your git checkout is located
COMROT=/scratch1/BMC/gsd-fv3-dev/${USER}/test/comrot                 ## default COMROT directory
EXPDIR=/scratch1/BMC/gsd-fv3-dev/${USER}/test/expdir                 ## default EXPDIR directory

cp $GITDIR/parm/config/config.base.emc.dyn $GITDIR/parm/config/config.base

PSLOT=gsdsuite
IDATE=2019100900
EDATE=2019100900
RESDET=768               ## 96 192 384 768

### gfs_cyc 1  00Z only;  gfs_cyc 2  00Z and 12Z

./setup_expt_fcstonly.py --pslot $PSLOT  \
       --gfs_cyc 1 --idate $IDATE --edate $EDATE \
       --configdir $GITDIR/parm/config \
       --res $RESDET --comrot $COMROT --expdir $EXPDIR

#for running chgres, forecast, and post 
./setup_workflow_fcstonly.py --expdir $EXPDIR/$PSLOT

