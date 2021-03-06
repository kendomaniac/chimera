
tophatInstallation <- function(binDir, os=c("unix","mac")){
    .Deprecated(old="tophatInstallation",new="subreadRun", package="chimera")
	mydir <- getwd()
	if(os=="unix"){
		bowtieDirLocation  <- paste(.path.package("chimera", quiet = FALSE), "/bowtie", sep="")
		bowtie2DirLocation  <- paste(.path.package("chimera", quiet = FALSE), "/bowtie2", sep="")
		tmp.info <- dir(paste(.path.package("chimera", quiet = FALSE)))
		if(length(grep("bowtie", tmp.info))>0){
		   unlink(bowtieDirLocation, recursive = T, force = T)
	    }
	    if(length(grep("bowtie2", tmp.info))>0){
		   unlink(bowtie2DirLocation, recursive = T, force = T)
	    }
		dir.create(bowtieDirLocation, showWarnings = TRUE, recursive = FALSE)
		setwd(bowtieDirLocation)
		cat("\nBegin downloads of bowtie.....\n")
		download.file("http://sourceforge.net/projects/bowtie-bio/files/bowtie/1.0.0/bowtie-1.0.0-linux-x86_64.zip/download", "bowtie.zip", mode="wb")
        cat("\nThe Bowtie downloaded version is bowtie_1_0_0\n")
        system(paste("unzip bowtie.zip", sep=""))
        system("cp -fR ./bowtie-1.0.0/* .")
        system("rm -fR ./bowtie-1.0.0/")
		dir.create(bowtie2DirLocation, showWarnings = TRUE, recursive = FALSE)
		setwd(bowtie2DirLocation)
		cat("\nBegin downloads of bowtie2.....\n")
		download.file("http://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.1.0/bowtie2-2.1.0-linux-x86_64.zip/download", "bowtie.zip", mode="wb")
        cat("\nThe Bowtie downloaded version is bowtie_2_1_0\n")
        system(paste("unzip bowtie.zip", sep=""))
        system("cp -fR ./bowtie2-2.1.0/* .")
        system("rm -fR ./bowtie2-2.1.0/")

        tophatDirLocation  <- paste(.path.package("chimera", quiet = FALSE), "/tophat", sep="")
		if(length(grep("tophat", tmp.info))>0){
		unlink(tophatDirLocation, recursive = T, force = T)
	    }		
        dir.create(tophatDirLocation, showWarnings = TRUE, recursive = FALSE)
        setwd(tophatDirLocation)
        cat("\nBegin downloads of tophat.....\n")
        download.file("http://tophat.cbcb.umd.edu/downloads/tophat-2.0.7.Linux_x86_64.tar.gz", "tophat.tar.gz", mode="wb")
        system("gzip -d tophat.tar.gz")
        system("tar xvf tophat.tar")
        cat("\nThe TopHat downloaded version is tophat-2.0.7.Linux_x86_64\n")
        system("cp -fR ./tophat-2.0.7.Linux_x86_64/* .")
        system("rm -fR ./tophat-2.0.7.Linux_x86_64/")
        samtoolsDirLocation <- paste(.path.package("chimera", quiet = FALSE), "/samtools", sep="")
		if(length(grep("samtools", tmp.info))>0){
		unlink(samtoolsDirLocation, recursive = T, force = T)
	    }		
		dir.create(samtoolsDirLocation, showWarnings = TRUE, recursive = FALSE)
		setwd(samtoolsDirLocation)
		cat("\nBegin downloads of samtools.....\n")
	    download.file("http://sourceforge.net/projects/ochguiextras/files/tools/samtools_linux64.tar.gz/download", "samtools.tar.gz", mode="wb")
	    system("gzip -d samtools.tar.gz")
	    system("tar xvf samtools.tar")
	    cat("\nThe Samtools downloaded version is samtools-0.1.18\n")
	    system("cp -fR ./samtools-0.1.18/* .")
	    system("rm -fR ./samtools-0.1.18/")
	    system(paste("chmod +x ",bowtieDirLocation, "/bowtie", sep=""))
		system(paste("ln -fs ",bowtieDirLocation,"/bowtie ", binDir, "/bowtie", sep=""))
		system(paste("chmod +x ",bowtieDirLocation, "/bowtie-build", sep=""))
		system(paste("ln -fs ",bowtieDirLocation,"/bowtie-build ", binDir, "/bowtie-build", sep=""))
		system(paste("chmod +x ",bowtieDirLocation, "/bowtie-inspect", sep=""))
		system(paste("ln -fs ",bowtieDirLocation,"/bowtie-inspect ", binDir, "/bowtie-inspect", sep=""))
		
		system(paste("chmod +x ",bowtie2DirLocation, "/bowtie2", sep=""))
		system(paste("ln -fs ",bowtie2DirLocation,"/bowtie2 ", binDir, "/bowtie2", sep=""))
		system(paste("chmod +x ",bowtie2DirLocation, "/bowtie2-build", sep=""))
		system(paste("ln -fs ",bowtie2DirLocation,"/bowtie2-build ", binDir, "/bowtie2-build", sep=""))
		system(paste("chmod +x ",bowtie2DirLocation, "/bowtie2-inspect", sep=""))
		system(paste("ln -fs ",bowtie2DirLocation,"/bowtie2-inspect ", binDir, "/bowtie2-inspect", sep=""))	
	    			
	    system(paste("chmod +x ",samtoolsDirLocation, "/samtools", sep=""))
		system(paste("ln -fs ",samtoolsDirLocation,"/samtools ", binDir, "/samtools", sep=""))
	    system(paste("chmod +x ",tophatDirLocation, "/bam2fastx", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/bam2fastx ", binDir, "/bam2fastx", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/bam_merge", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/bam_merge ", binDir, "/bam_merge", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/bed_to_juncs", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/bed_to_juncs ", binDir, "/bed_to_juncs", sep=""))
#		system(paste("chmod +x ",tophatDirLocation, "/closure_juncs", sep=""))
#		system(paste("ln -fs ",tophatDirLocation,"/closure_juncs ", binDir, "/closure_juncs", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/contig_to_chr_coords", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/contig_to_chr_coords ", binDir, "/contig_to_chr_coords", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/fix_map_ordering", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/fix_map_ordering ", binDir, "/fix_map_ordering", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/gtf_juncs", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/gtf_juncs ", binDir, "/gtf_juncs", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/gtf_to_fasta", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/gtf_to_fasta ", binDir, "/gtf_to_fasta", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/juncs_db", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/juncs_db ", binDir, "/juncs_db", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/long_spanning_reads", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/long_spanning_reads ", binDir, "/long_spanning_reads", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/map2gtf", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/map2gtf ", binDir, "/map2gtf", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/prep_reads", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/prep_reads ", binDir, "/prep_reads", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/sam_juncs", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/sam_juncs ", binDir, "/sam_juncs", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/segment_juncs", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/segment_juncs ", binDir, "/segment_juncs", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/tophat", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/tophat ", binDir, "/tophat", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/tophat_reports", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/tophat_reports ", binDir, "/tophat_reports", sep=""))
		cat(paste("\nTopHat, bowtie and samtools have been installed and soft links created in\n",binDir,"\n",sep=""))
        setwd(mydir)
        return()
	}else if(os=="mac"){
		bowtieDirLocation  <- paste(.path.package("chimera", quiet = FALSE), "/bowtie", sep="")
		tmp.info <- dir(paste(.path.package("chimera", quiet = FALSE)))
		if(length(grep("bowtie", tmp.info))>0){
		   unlink(bowtieDirLocation, recursive = T, force = T)
	    }
	    if(length(grep("bowtie2", tmp.info))>0){
		    unlink(bowtie2DirLocation, recursive = T, force = T)
	    }
		dir.create(bowtieDirLocation, showWarnings = TRUE, recursive = FALSE)
		setwd(bowtieDirLocation)
		cat("\nBegin downloads of bowtie.....\n")
		download.file("http://sourceforge.net/projects/bowtie-bio/files/bowtie/1.0.0/bowtie-1.0.0-macos-x86_64.zip/download", "bowtie.zip", mode="wb")
		unzip("bowtie.zip")
        cat("\nThe Bowtie downloaded version is bowtie_1_0_0\n")
        system("cp -fR ./bowtie-1.0.0/* .")
        system("rm -fR ./bowtie-1.0.0/")

		dir.create(bowtie2DirLocation, showWarnings = TRUE, recursive = FALSE)
		setwd(bowtie2DirLocation)
		cat("\nBegin downloads of bowtie2.....\n")
		download.file("http://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.1.0/bowtie2-2.1.0-macos-x86_64.zip/download", "bowtie.zip", mode="wb")
		unzip("bowtie.zip")
        cat("\nThe Bowtie downloaded version is bowtie_2_1_0\n")
        system("cp -fR ./bowtie-2.1.0/* .")
        system("rm -fR ./bowtie-2.1.0/")

		tophatDirLocation  <- paste(.path.package("chimera", quiet = FALSE), "/tophat", sep="")
		if(length(grep("tophat", tmp.info))>0){
		unlink(tophatDirLocation, recursive = T, force = T)
	    }		
        dir.create(tophatDirLocation, showWarnings = TRUE, recursive = FALSE)
        setwd(tophatDirLocation)
        cat("\nBegin downloads of tophat.....\n")
        download.file("http://tophat.cbcb.umd.edu/downloads/tophat-2.0.7.OSX_x86_64.tar.gz", "tophat.tar.gz", mode="wb")
        system("gzip -d tophat.tar.gz")
        system("tar xvf tophat.tar")
        cat("\nThe TopHat downloaded version is tophat-2.0.7.OSX_x86_64\n")
        system("cp -fR ./tophat-2.0.7.OSX_x86_64/* .")
        system("rm -fR ./tophat-2.0.7.OSX_x86_64/")
		samtoolsDirLocation <- paste(.path.package("chimera", quiet = FALSE), "/samtools", sep="")
		if(length(grep("samtools", tmp.info))>0){
		unlink(samtoolsDirLocation, recursive = T, force = T)
	    }		
        dir.create(samtoolsDirLocation, showWarnings = TRUE, recursive = FALSE)
        setwd(samtoolsDirLocation)
        cat("\nBegin downloads of samtools.....\n")
        download.file("http://sourceforge.net/projects/ochguiextras/files/tools/samtools_mac64.tar.gz/download", "samtools.tar.gz", mode="wb")
        system("gzip -d samtools.tar.gz")
        system("tar xvf samtools.tar")
        cat("\nThe Samtools downloaded version is samtools-0.1.18\n")
        system("cp -fR ./samtools-0.1.18/* .")
        system("rm -fR ./samtools-0.1.18/")
        system(paste("chmod +x ",bowtieDirLocation, "/bowtie", sep=""))
		system(paste("ln -fs ",bowtieDirLocation,"/bowtie ", binDir, "/bowtie", sep=""))
		system(paste("chmod +x ",bowtieDirLocation, "/bowtie-build", sep=""))
		system(paste("ln -fs ",bowtieDirLocation,"/bowtie-build ", binDir, "/bowtie-build", sep=""))
		system(paste("chmod +x ",bowtieDirLocation, "/bowtie-inspect", sep=""))
		system(paste("ln -fs ",bowtieDirLocation,"/bowtie-inspect ", binDir, "/bowtie-inspect", sep=""))	
		
		system(paste("chmod +x ",bowtie2DirLocation, "/bowtie2", sep=""))
		system(paste("ln -fs ",bowtie2DirLocation,"/bowtie2 ", binDir, "/bowtie2", sep=""))
		system(paste("chmod +x ",bowtie2DirLocation, "/bowtie2-build", sep=""))
		system(paste("ln -fs ",bowtie2DirLocation,"/bowtie2-build ", binDir, "/bowtie2-build", sep=""))
		system(paste("chmod +x ",bowtie2DirLocation, "/bowtie2-inspect", sep=""))
		
	    system(paste("chmod +x ",samtoolsDirLocation, "/samtools", sep=""))
		system(paste("ln -fs ",samtoolsDirLocation,"/samtools ", binDir, "/samtools", sep=""))
	    system(paste("chmod +x ",tophatDirLocation, "/bam2fastx", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/bam2fastx ", binDir, "/bam2fastx", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/bam_merge", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/bam_merge ", binDir, "/bam_merge", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/bed_to_juncs", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/bed_to_juncs ", binDir, "/bed_to_juncs", sep=""))
#		system(paste("chmod +x ",tophatDirLocation, "/closure_juncs", sep=""))
#		system(paste("ln -fs ",tophatDirLocation,"/closure_juncs ", binDir, "/closure_juncs", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/contig_to_chr_coords", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/contig_to_chr_coords ", binDir, "/contig_to_chr_coords", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/fix_map_ordering", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/fix_map_ordering ", binDir, "/fix_map_ordering", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/gtf_juncs", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/gtf_juncs ", binDir, "/gtf_juncs", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/gtf_to_fasta", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/gtf_to_fasta ", binDir, "/gtf_to_fasta", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/juncs_db", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/juncs_db ", binDir, "/juncs_db", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/long_spanning_reads", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/long_spanning_reads ", binDir, "/long_spanning_reads", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/map2gtf", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/map2gtf ", binDir, "/map2gtf", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/prep_reads", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/prep_reads ", binDir, "/prep_reads", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/sam_juncs", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/sam_juncs ", binDir, "/sam_juncs", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/segment_juncs", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/segment_juncs ", binDir, "/segment_juncs", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/tophat", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/tophat ", binDir, "/tophat", sep=""))
		system(paste("chmod +x ",tophatDirLocation, "/tophat_reports", sep=""))
		system(paste("ln -fs ",tophatDirLocation,"/tophat_reports ", binDir, "/tophat_reports", sep=""))
	    cat(paste("\nTopHat, bowtie and samtools have been installed and soft links created in\n",binDir,"\n",sep=""))
        setwd(mydir)
        return()
	}else{
		cat("\nYou have selected a os not compatible with tophat!\n")
		setwd(mydir)
		return()
	}
	
}

tophatRun <- function(input1, input2, output,cores=1, bowtie= c("bowtie","bowtie2"), tophat= "tophat",ebwt=paste(getwd(),"mychimera.fa",sep="/"), alignment=c("se","pe"))
{
           .Deprecated(old="tophatRun",new="subreadRun", package="chimera")
           check.tophat <- system("tophat 2>&1", intern=T)
#           if(length(grep("Error",check.tophat[[1]])) > 0){
	        if(length(as.character(check.tophat)) == 0){
	            cat("\nIt seems that TopHat is not installed in your system:\n")
	            cat("please install it using the function: tophatInstallation\nAfter running tophatInstallation. Close R and the shell\n")
	            return()
           }
           check.samtools <- system("samtools 2>&1", intern=T)
#		   if(length(grep("samtools", check.samtools[2])) == 0){
	        if(length(as.character(check.samtools)) == 0){
	            cat("\nIt seems that samtools is not installed in your system:\n")
	            cat("please install it using the function: tophatInstallation")
	            return()
           }
           #building bowtie db
           if(bowtie=="bowtie"){
              check.bowtie <- system("bowtie 2>&1", intern=T)
	          if(length(as.character(check.bowtie)) == 0){
	            cat("\nIt seems that bowtie is not installed in your system:\n")
	            cat("please install it using the function: tophatInstallation")
	            return()
              }
           }else if(bowtie=="bowtie2"){
	              check.bowtie <- system("bowtie2 2>&1", intern=T)
		          if(length(as.character(check.bowtie)) == 0){
		            cat("\nIt seems that bowtie2 is not installed in your system:\n")
		            cat("please install it using the function: tophatInstallation")
		            return()
	              }
	       }
           chimera.db <- paste("chimeraDB",gsub("[' '| :]","-", date()),sep="_")
           system(paste("nohup ",bowtie,"-build"," ", ebwt, " ", chimera.db,sep=""), wait=T)
           tmp.bam <- paste("tmp",gsub("[' '| :]","-", date()),sep="_")
           cat("\nMapping ", input1, input2, "\n")
           if(bowtie=="bowtie"){
               if(alignment=="se"){
	               tophat.run <- paste("nohup ",tophat," --bowtie1 -r 120 -a 12 --solexa-quals -p ",cores," --library-type fr-unstranded  -o ", output, " ", chimera.db, " ", input1, ",", input2,sep="")
                   system(tophat.run, wait=F)
               }else if(alignment=="pe"){
	               tophat.run <- paste("nohup ",tophat," --bowtie1 -r 120 -a 12 --solexa-quals -p ",cores," --library-type fr-unstranded  -o ", output, " ", chimera.db, " ", input1, " ", input2,sep="")
                   system(tophat.run, wait=F)
               }
           }else if(bowtie=="bowtie2"){
	               if(alignment=="se"){
		               tophat.run <- paste("nohup ",tophat," -r 120 -a 12 --solexa-quals -p ",cores," --library-type fr-unstranded  -o ", output, " ", chimera.db, " ", input1, ",", input2,sep="")
	                   system(tophat.run, wait=F)
	               }else if(alignment=="pe"){
		               tophat.run <- paste("nohup ",tophat," -r 120 -a 12 --solexa-quals -p ",cores," --library-type fr-unstranded  -o ", output, " ", chimera.db, " ", input1, " ", input2,sep="")
	                   system(tophat.run, wait=F)
	               }
	       }
           cat("\nTopHat is running in background\n")
}
#