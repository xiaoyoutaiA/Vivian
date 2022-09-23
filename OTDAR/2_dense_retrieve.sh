CUDA_VISIBLE_DEVICES=0,1,2,3 python dense_retriever.py \
	model_file='/root/qty/DAR-main/outputs/2022-09-19/12-36-59/trivia_dar/dpr_biencoder.22' \
	qa_dataset=nq_test \
	ctx_datatsets=[dpr_wiki] \
	encoded_ctx_files=['/root/qty/DAR-main/generated_embeddings/nq_dar_*'] \
	out_file='nq_dar_retrieved'
