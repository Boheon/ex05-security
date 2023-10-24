package org.galapagos.service;

import org.galapagos.domain.kakao.book.BookResult;
import org.galapagos.domain.kakao.local.LocalResult;

import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;
import retrofit2.http.GET;
import retrofit2.http.Headers;
import retrofit2.http.Query;

public interface KakaoSearchService {
	String BASE_URL = "https://dapi.kakao.com/";

	@GET("v3/search/book")
	@Headers({ "Authorization: KakaoAK d110d497a82bb8b17166864cb219aeb6" })
	Call<BookResult> searchBook(
			@Query("query") String query, 
			@Query("size") int size, 
			@Query("page") int page);

	
	@GET("v2/local/search/keyword")
	@Headers({ "Authorization: KakaoAK d110d497a82bb8b17166864cb219aeb6" })
	Call<LocalResult> searchLocal(
			@Query("query") String query, 
			@Query("size") int size, 
			@Query("page") int page);
	
	
	public static KakaoSearchService getService() {
		Retrofit retrofit = new Retrofit.Builder().baseUrl(BASE_URL)
				.addConverterFactory(GsonConverterFactory.create()).build();	

		return retrofit.create(KakaoSearchService.class);
	}
}
