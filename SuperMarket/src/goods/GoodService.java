package goods;

import java.util.List;

public interface GoodService {
public List<Fen> selectFen();
public Goods selectGood(String id);
public List<Goods> selectAllGoods();
public int updateKu(String id,int num);
}
