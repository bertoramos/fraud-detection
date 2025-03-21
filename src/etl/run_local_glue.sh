docker run -it \
	-v /home/alber/.aws:/home/glue_user/.aws \
	-v /mnt/d/AWS/jar/:/opt/aws/glue/lib/ \
	-v /mnt/d/AWS/fraud-detection/src/etl:/home/glue_user/workspace/jupyter_workspace/ \
	-e AWS_PROFILE=default \
	-e DISABLE_SSL=true \
	-e PYSPARK_SUBMIT_ARGS="--jars /opt/aws/glue/lib/mysql-connector-java-8.0.23.jar pyspark-shell" \
	--rm -p 4040:4040 -p 18080:18080 -p 8998:8998 -p 8888:8888 \
	--name glue_jupyter_lab \
	amazon/aws-glue-libs:glue_libs_4.0.0_image_01 \
	/home/glue_user/jupyter/jupyter_start.sh
