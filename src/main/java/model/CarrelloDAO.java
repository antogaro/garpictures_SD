package model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarrelloDAO {

    public ArrayList<Prodotto> doRetriveByIDUtente(int id){
        ArrayList<Prodotto> prodottiCarrello = new ArrayList<Prodotto>();
        try(Connection connection = ConnessioneDB.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT prodotto.id, prodotto.nome, prodotto.prezzo, prodotto.src FROM Garpictures.prodotto, Garpictures.carrello WHERE carrello.prodotto_id = prodotto.id AND carrello.utente_id=?");
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                Prodotto prodotto = new Prodotto();
                prodotto.setId(rs.getInt(1));
                prodotto.setNome(rs.getString(2));
                prodotto.setPrezzo(rs.getInt(3));
                prodotto.setSource(rs.getString(4));
                prodottiCarrello.add(prodotto);
            }
            return prodottiCarrello;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doSave(Utente utente,Prodotto prodotto) {
        try (Connection con = ConnessioneDB.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO carrello (utente_id,prodotto_id) VALUES(?,?)"
            );
            ps.setInt(1, utente.getId());
            ps.setInt(2, prodotto.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doDelete(Utente utente,Prodotto prodotto) {
        try (Connection con = ConnessioneDB.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM carrello WHERE prodotto_id=? AND utente_id=?"
            );
            ps.setInt(1, prodotto.getId());
            ps.setInt(2, utente.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doDelete(Prodotto prodotto){
        try (Connection con = ConnessioneDB.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM carrello WHERE prodotto_id=NULL"
            );
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doSave(Prodotto prodotto) {
        try (Connection con = ConnessioneDB.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO carrello (prodotto_id) VALUES(?)"
            );
            ps.setInt(1, prodotto.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
