###################################################################
#	Make file for RavenX.						  
#																  
#	NOTE: Do not change this file unless otherwise instructed.    
#																  
###################################################################

DIR = c:/gba_studio
include $(DIR)/system/master.mak



 ####################
# GBA ROM Image Name #
 ####################

PROGNAME="RavenX"



 #########################################
# Set a list of files you want to compile #
 #########################################
 
OFILES += main.o myLib.o img_spritesheet.o img_splash.o background1.o background2.o bgClouds.o s_background.o s_longexpl.o s_ravenx.o s_explosion.o s_synth.o text.o



 #########################################################
# Compile using Krawall (sound stuff, don't mess with it) #
 #########################################################
 
USE_KRAWALL=no
KRAWALL_IS_REGISTERED=no
KRAWALL_FILES=



 ######################################
# Standard Makefile targets start here #
 ######################################
all : $(PROGNAME).$(EXT) clean



 ##############################################
# Most Makefile targets are predefined for you,#
# such as vba, clean ... in the following file #
 ##############################################

include $(DIR)/system/standard-targets.mak



 #####################################
# Custom  Makefile targets start here #
 #####################################

gfx: makefile




