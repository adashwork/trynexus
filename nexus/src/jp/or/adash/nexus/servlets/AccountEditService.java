package jp.or.adash.nexus.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jp.or.adash.nexus.entity.Staff;
import jp.or.adash.nexus.utils.dao.AccountEditDao;
import jp.or.adash.nexus.utils.dao.Transaction;

public class AccountEditService {
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
	public AccountEditService() {
		transaction = new Transaction();
		messages = new ArrayList<String>();
	}
	public List<String> getMessages() {
		return messages;
	}
	/**
	 * アカウント情報を更新する
	 * @param Staff アカウント情報
	 * @return 処理結果（true:成功、false:失敗）
	 */
	public boolean updateStaff(Staff staff) {
		boolean result = false;	// 0処理結果

		try {
			//0データベース接続を開始する
			transaction.open();

			//0 トランザクションを開始する
			transaction.beginTrans();

			//0アカウント情報を取得する
			AccountEditDao dao = new AccountEditDao(transaction);
			int count = dao.update(staff);

			if (count > 0) {
				//0完了メッセージをセットする
				messages.add("更新が完了しました。");
				result = true;
			} else {
				//0エラーメッセージをセットする
				messages.add("更新に失敗しました。");
			}

			//0トランザクションをコミットする
			transaction.commit();

		} catch(IOException e) {
			//0トランザクションをロールバックする
			transaction.rollback();

			//0エラーメッセージをセットする
			messages.add("データベースアクセスに失敗しました。");
		} finally {
			//0データベース接続をを終了する
			transaction.close();
		}
		return result;
	}
	/**
	 * アカウントIDを元に、アカウント情報を取得する
	 * @param id アカウントID
	 * @return 求職者情報
	 */
	public Staff getStaffAccount(String id) {
		Staff staff = null;

		try {
			// データベース接続を開始する
			transaction.open();

			// 商品単価を取得する
			AccountEditDao dao = new AccountEditDao(transaction);
			staff = dao.selectStaff(id);

		} catch(IOException e) {
			// エラーメッセージをセットする
		} finally {
			// データベース接続をを終了する
			transaction.close();
		}

		return staff;
	}
}
