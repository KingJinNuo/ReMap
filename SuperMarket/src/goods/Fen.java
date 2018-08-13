package goods;

public class Fen {
	private String fenId;
	private String fenName;
	public String getFenId() {
		return fenId;
	}
	public void setFenId(String fenId) {
		this.fenId = fenId;
	}
	public String getFenName() {
		return fenName;
	}
	public void setFenName(String fenName) {
		this.fenName = fenName;
	}
	public Fen(String fenId, String fenName) {
		super();
		this.fenId = fenId;
		this.fenName = fenName;
	}
	public Fen() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Fen [fenId=" + fenId + ", fenName=" + fenName + "]";
	}
	
	
}
