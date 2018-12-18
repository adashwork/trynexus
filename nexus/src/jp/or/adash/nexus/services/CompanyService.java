package jp.or.adash.nexus.services;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.stream.events.Comment;

import jp.or.adash.nexus.dao.CompanyDao;
import jp.or.adash.nexus.entity.Company;
import jp.or.adash.nexus.entity.CompanySearch;
import jp.or.adash.nexus.entity.CompanySearchResult;
import jp.or.adash.nexus.utils.common.MessageCommons;
import jp.or.adash.nexus.utils.common.StringCommons;
import jp.or.adash.nexus.utils.dao.Transaction;

/**
 * 企業情報の登録・更新・削除／検索に関連するServiceクラス
 * @author
 *
 */

public class CompanyService {

	String errMsg = null;
	/**
	 * トランザクションオブジェクト
	 */
	private Transaction transaction;

	/**
	 * 処理結果メッセージを格納するリスト
	 */
	private List<String> messages;

	/**
	 * コンストラクタ
	 */
	public CompanyService() {
	messages = new ArrayList<String>();
	}


	/**
	 * メッセージのリストを取得する
	 * @return  List<String>
	 */
	public List<String> getMessages() {
		return messages;
	}

	/**
	 * コンストラクタ
	 */
	public CompanyService() {
		transaction = new Transaction();
		messages = new ArrayList<String>();
	}

	/**
	 * Companyデータのバリデーション
	 * @param company
	 * @return true:数値に異常がなければ  false:異常が１つでもあれば
	 */
	public boolean check(Company company) {
		boolean checkResult = true;

		//共通データチェッククラス
		CommonsService commonsService = new CommonsService();

		//項目ごとにバリデーションを行う
		//事業者番号(PK)
		//からっぽの場合はエラーを出さない。基本的にその場合は独自の事業所番号を割り振るため。
		if (!"".equals(company.getCompanyNo())) {
			//Aから始まる場合
			if ("A".equals(String.valueOf(company.getCompanyNo().charAt(0)))) {

				if (!company.getCompanyNo().matches("^A[0-9]{3}-[0-9]{6}-[0]{1}$")) {
					checkResult = false;
					messages.add("Aから始まる事業所番号のフォーマットが間違っています");
				}
			} else {
				//Aから始まらない場合は
				if (!company.getCompanyNo().matches("^[0-9]{4}-[0-9]{6}-[0-9]{1}$")) {
					checkResult = false;
					messages.add("事業所番号は0000-000000-0のフォーマットで記入してください");
				}
			}
		}


		return checkResult;
	}

	/**
	 * 企業情報を新規登録する
	 * @param company
	 * @return true:成功時  false:失敗時
	 */
	public boolean insertCompany(Company company) {
		boolean result = false; // 処理結果

		try {
			// データベース接続を開始する
			transaction.open();

			// トランザクションを開始する
			transaction.beginTrans();

			CompanyDao companyDao = new CompanyDao(transaction);
			int count = companyDao.insertCompany(company);

			if (count > 0) {
				// 完了メッセージをセットする
				messages.add("登録が完了しました");
				result = true;
			} else {
				// エラーメッセージをセットする
				messages.add("登録に失敗しました");
				result = false;
			}

			// トランザクションをコミットする
			transaction.commit();

		} catch (IOException e) {
			// トランザクションをロールバックする
			transaction.rollback();

			// エラーメッセージをセットする
			messages.add("データベースアクセスに失敗しました。");
		} finally {
			// データベース接続をを終了する
			transaction.close();
		}

		return result;

	}

	/**
	 * 企業情報を更新する
	 * @param company
	 * @return true:成功時  false:失敗時
	 */
	public boolean updateCompany(Company company) {
		boolean result = false; // 処理結果
		try {
			// データベース接続を開始する
			transaction.open();

			// トランザクションを開始する
			transaction.beginTrans();

			CompanyDao companyDao = new CompanyDao(transaction);
			int count = companyDao.updateCompany(company);

			if (count > 0) {
				// 完了メッセージをセットする
				messages.add("更新が完了しました");
				result = true;
			} else {
				// エラーメッセージをセットする
				messages.add("更新に失敗しました");
				result = false;
			}

			// トランザクションをコミットする
			transaction.commit();

		} catch (IOException e) {
			// トランザクションをロールバックする
			transaction.rollback();

			// エラーメッセージをセットする
			messages.add("データベースアクセスに失敗しました。");
		} finally {
			// データベース接続をを終了する
			transaction.close();
		}

		return result;

	}

	/**
	 * 企業情報を削除する
	 * @param companyNo
	 * @return true:成功時  false:失敗時
	 */
	public boolean delteCompany(String companyNo) {
		boolean result = false; // 処理結果
		try {
			// データベース接続を開始する
			transaction.open();

			// トランザクションを開始する
			transaction.beginTrans();

			CompanyDao companyDao = new CompanyDao(transaction);
			int count = companyDao.deleteCompany(companyNo);

			if (count > 0) {
				// 完了メッセージをセットする
				messages.add("企業情報が削除されました");
				result = true;
			} else {
				// エラーメッセージをセットする
				messages.add("企業を削除できませんでした");
				result = false;
			}

			// トランザクションをコミットする
			transaction.commit();

		} catch (IOException e) {
			// トランザクションをロールバックする
			transaction.rollback();

			// エラーメッセージをセットする
			messages.add("データベースアクセスに失敗しました。");
		} finally {
			// データベース接続をを終了する
			transaction.close();
		}

		return result;

	}

	/**
	 * 企業の詳細情報を取得する
	 * @param companyNo
	 * @return Companyオブジェクト
	 */
	public Company getCompanyInfo(String companyNo) {
		Company company = null;

		try {
			// データベース接続を開始する
			transaction.open();

			// 企業情報を取得する
			CompanyDao dao = new CompanyDao(transaction);
			company = dao.selectCompanyInfo(companyNo);

		} catch (IOException e) {
			// エラーメッセージをセットする
		} finally {
			// データベース接続をを終了する
			transaction.close();
		}

		return company;
	}

	/**
	 * 企業のコメント一覧を取得する
	 * @param companyNo
	 * @return Commentオブジェクト
	 */
	public List<Comment> getCompanyCommentList(String companyNo) {
		List<Comment> commentList = null;

		try {
			// データベース接続を開始する
			transaction.open();

			// 企業情報を取得する
			CommentDao dao = new CommentDao(transaction);
			commentList = dao.selectCompanyCommentList(companyNo);

		} catch (IOException e) {
			// エラーメッセージをセットする
		} finally {
			// データベース接続をを終了する
			transaction.close();
		}

		return commentList;

	}

	/**
	 * 独自のユニークなCompanyNoを取得する
	 * 頭に「A」を付け加えた13文字の独自companyNoを生成
	 *
	 * @return CompanyNo
	 * @throws IOException
	 */
	public String createUniqueCompanyNo() throws IOException {
		//采番マスタよりデータ取得
		try {
			transaction.open();
			SaibanDao saidao = new SaibanDao(transaction);
			int saiban = saidao.getCompanyInt();
			String saibanString = String.valueOf(saiban);

			//独自の事業所番号を生成
			StringBuffer uniqueCompanyNo = new StringBuffer();
			uniqueCompanyNo.append("A");
			for (int i = saibanString.length() + 1; i < 11; i++) {
				uniqueCompanyNo.append("0");
			}
			uniqueCompanyNo.append(saibanString);
			uniqueCompanyNo.insert(4, "-");
			uniqueCompanyNo.insert(11, "-");

			return uniqueCompanyNo.toString();
		} catch (IOException e) {
			throw new IOException(e);
		} finally {
			// データベース接続をを終了する
			transaction.close();
		}
	}



	/**
	 * 企業情報を取得する（検索）
	 * @return List<CompanySearchResult> companyList 該当した企業の一覧
	 * @author mosco
	 */


	public List<CompanySearchResult> getCompanyList(CompanySearch cse) {
		List<CompanySearchResult> companyList = new ArrayList<>();

		// CompanySearchオブジェクトから検索条件の値を取り出す
		String staffId = cse.getStaffId();						// A'担当者のID
		String jobCategory = cse.getJobCategory();				// 産業大分類のコード
		String companyNameSub = cse.getCompanyName();			// 企業名入力欄に入力された値
		String companyPlaceSub = cse.getCompanyPlace();		// 所在地・最寄り駅の欄に入力された値

		//  企業名入力欄に入力された値をスペースごとに単語に分割、配列に格納
		String[] companyName = StringCommons.splitWords(companyNameSub);
		// 所在地・最寄り駅の欄に入力された値も同様に
		String[] companyPlace = StringCommons.splitWords(companyPlaceSub);

		Transaction transaction = new Transaction();
		CompanyDao dao;
		try {
			// データベース接続を開く
			transaction.open();
			// DBから企業情報を取得し、Dao内のメソッドでListに詰め、そのListを返してもらう
			dao = new CompanyDao(transaction);
			companyList = dao.selectCompanyList(staffId,jobCategory,companyName,companyPlace);

		} catch(IOException e) {
			// DB接続が失敗した場合、例外をキャッチする
			messages.add(MessageCommons.ERR_DB_CONNECT);
		} finally {
			try {
				// DB接続の終了
				dao = null;
				transaction.close();
			} catch(Exception e) {
				transaction = null;
			}
		}

		return companyList;
	}



}
