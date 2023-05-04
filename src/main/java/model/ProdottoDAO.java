package model;

import java.sql.*;
import java.util.ArrayList;

public class ProdottoDAO {

    private Prodotto prodotto;

    public Prodotto doRetriveByID(int id){
        try(Connection connection = ConnessioneDB.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT id,nome,prezzo,src,descrizione FROM prodotto WHERE id=?");
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                Prodotto prodotto = new Prodotto();
                prodotto.setId(rs.getInt(1));
                prodotto.setNome(rs.getString(2));
                prodotto.setPrezzo(rs.getFloat(3));
                prodotto.setSource(rs.getString(4));
                prodotto.setDescrizione(rs.getString(5));
                return prodotto;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Prodotto doRetriveLatest(){
        try(Connection connection = ConnessioneDB.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT MAX(id),nome,prezzo,src FROM Garpictures.prodotto");
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                Prodotto prodotto = new Prodotto();
                prodotto.setId(rs.getInt(1));
                prodotto.setNome(rs.getString(2));
                prodotto.setPrezzo(rs.getFloat(3));
                prodotto.setSource(rs.getString(4));
                return prodotto;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doSave(Prodotto prodotto) {
        this.prodotto = prodotto;
        try (Connection con = ConnessioneDB.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO prodotto (nome,src,prezzo,descrizione) VALUES(?,?,?,?)"
            );
            ps.setString(1,prodotto.getNome());
            ps.setString(2,prodotto.getSource());
            ps.setFloat(3,prodotto.getPrezzo());
            ps.setString(4,prodotto.getDescrizione());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Prodotto> doRetriveAll(){
        ArrayList<Prodotto> prodotti = new ArrayList<>();
        Statement statement;
        ResultSet rs;
        try(Connection connection = ConnessioneDB.getConnection()){
            statement = connection.createStatement();
            rs = statement.executeQuery("SELECT * FROM prodotto");
            while(rs.next()){
                Prodotto prodotto = new Prodotto();
                prodotto.setId(rs.getInt(1));
                prodotto.setNome(rs.getString(2));
                prodotto.setSource(rs.getString(3));
                prodotto.setPrezzo(rs.getFloat(4));
                prodotto.setDescrizione(rs.getString(5));
                prodotti.add(prodotto);
            }
            return prodotti;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Prodotto> doRetriveByTag(Tag tag){
        ArrayList<Prodotto> prodotti = new ArrayList<>();
        try(Connection connection = ConnessioneDB.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT prodotto.id, prodotto.nome, prodotto.src, prodotto.prezzo, prodotto.descrizione FROM prodotto, tag_prodotto WHERE prodotto.id = tag_prodotto.id_prodotto AND tag_prodotto.nome_tag =? ");
            preparedStatement.setString(1,tag.getTag());
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                Prodotto prodotto = new Prodotto();
                prodotto.setId(rs.getInt(1));
                prodotto.setNome(rs.getString(2));
                prodotto.setSource(rs.getString(3));
                prodotto.setPrezzo(rs.getFloat(4));
                prodotto.setDescrizione(rs.getString(5));
                prodotti.add(prodotto);
            }
            return prodotti;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doDeleteByID(int id){
        try(Connection connection = ConnessioneDB.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM prodotto WHERE id=?");
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
