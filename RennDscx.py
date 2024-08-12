#
# Wrapper function for program dscx
#
# IN    pthImg  image file path
#       pthOut  output file path
#       Admin   administration, u_ProgExecAdmin.m
#
# OUT   Out     standard output
#
import subprocess

def RennDscx( pthImg, pthOut, Admin ):

    # https://docs.python.org/3/library/subprocess.html
    # python 3.6
    cmd  = 'dscx ' + pthImg + ' ' + pthOut + ' ' + Admin.optS
    #Args = subprocess.run( [ "dscx", pthImg, pthOut, Admin.optS ],
    Args = subprocess.run( cmd,
			   stdout = subprocess.PIPE,
			   stderr = subprocess.PIPE,
			   universal_newlines = True )
    
    print( Args.stdout )
    print( Args.stderr )

    # ------  Verify Proper Termination  -----
    ixEOP = Args.stdout.find('EndOfProgram')
    if ixEOP<0:
        print('Program dscx was not executed. Output below:' )
        print( Admin.optS )
        print( Args.stdout )
        quit()

    return Args.stdout


