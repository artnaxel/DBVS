import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.*;

public class UserInterface {

    private static boolean runUI = true;
    private final BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
    private SQL db;

    public void createUI(String password) {
        try {
            db = new SQL(password);
            printMenu();
            while(runUI) {
                System.out.print(">");
                int choice = Integer.parseInt(bufferedReader.readLine());

                switch (choice) {
                    case 0:
                        runUI = false;
                        System.out.println("Sėkmingai išėjote iš programos...");
                        db.closeConnection();
                        break;
                    case 1:
                        findPatientVisits();
                        break;
                    case 2:
                        registerNewPatient();
                        break;
                    case 3:
                        registerVisit();
                        break;
                    case 4:
                        changeDoctorSalary();
                        break;
                    case 5:
                        cancelVisit();
                        break;
                    case 6:
                        dismissDoctor();
                        break;
                    case 7:
                        displayAllVisits();
                        break;
                    default:
                        System.out.println("Blogas pasirinkimas");
                        break;
                }
            }
        } catch (IOException e) {
            System.out.println("Klaida skaitant ivesti");
        } catch (NumberFormatException e) {
            System.out.println("Netinkamas ivesties formatas");
        }
    }
    public static void printMenu(){
        System.out.println("Meniu:\n" +
                "[0] - Uzbaigti darba\n" +
                "[1] - Rasti paciento apsilankymus\n" +
                "[2] - Uzregistruoti nauja pacienta\n" +
                "[3] - Uzregistruoti nauja apsilankyma\n" +
                "[4] - Pakeisti gydytojo alga\n" +
                "[5] - Atsaukti apsilankyma\n" +
                "[6] - Atleisti gydytoja is pareigu\n" +
                "[7] - Parodyti visus apsilankymus\n"

        );
    }
    public void findPatientVisits(){
        LinkedList <List> result;
        try {
            result = db.queryExecute("SELECT AK, Vardas, Pavarde FROM alko8100.Pacientas");

            displayAllPatients();

            System.out.println("\nIveskite paciento asmens koda:");
            String ak = bufferedReader.readLine();

            if(isValidId(ak)){
                result = db.queryExecute("SELECT Nr, Gydytojas, Laikas, Data FROM alko8100.Apsilankymas, alko8100.Pacientas" +
                        " WHERE Pacientas.AK = Apsilankymas.Pacientas AND Pacientas.AK = '" + ak + "'");
                if(result.size() == 0){
                    System.out.println("Pacientas apsilankymu neturi!");
                }
                else{
                    System.out.println("Paciento apsilankymai:\n");
                    System.out.printf("%s %4s %14s %9s %13s %9s %14s\n\n", "Nr", "|", "Gydytojo AK","|", "Laikas", "|", "Data");
                    for (List list : result) {
                        System.out.printf("%s %20s %25s %25s\n", list.get(0), list.get(1), list.get(2), list.get(3));
                    }
                }
            }
            else{
                System.out.println("Netinkamas asmens kodas!");
            }
        }
        catch (Exception ex){
            System.out.println("Ivyko klaida: " + ex.getMessage());
        }

    }
    public void registerNewPatient(){
        System.out.println("Iveskite naujo paciento asmens koda, varda, pavarde, gimimo data, lyti bei telefono numeri:\n");
        try {
            int success = 0;

            System.out.println("Asmens kodas: ");
            String ak = bufferedReader.readLine();

            System.out.println("Vardas: ");
            String vardas = bufferedReader.readLine();

            System.out.println("Pavarde: ");
            String pavarde = bufferedReader.readLine();

            System.out.println("Gimimo data: ");
            String gimimoData = bufferedReader.readLine();

            System.out.println("Lytis: ");
            String lytis = bufferedReader.readLine();

            System.out.println("Telefono nr.: ");
            String telNr = bufferedReader.readLine();

            if(isValidId(ak) && isValidNameSurname(vardas) && isValidNameSurname(pavarde) && isValidDate(gimimoData) && (lytis.equals("Moteris") || lytis.equals("Vyras")) && (telNr.length() == 11 || telNr.length() == 9)){
                success = db.queryUpdate("INSERT INTO alko8100.Pacientas VALUES('"+ ak + "', '" + vardas +"', '" + pavarde + "', '" + gimimoData + "', '" + lytis + "', '" + telNr +"')", false);
                if(success == 0)
                    System.out.println("Paciento registravimas nesekmingas!");
                else
                    System.out.println("Sekmingai uzregistravote nauja pacienta!");
            }
            else{
                System.out.println("Netinkama duomenu ivestis!");
            }
        }
        catch (Exception ex){
            System.out.println("Klaida registruojant pacienta!");
            ex.printStackTrace();
        }
    }
    public void registerVisit(){
        LinkedList<List> result;
        try{
            int successVisit = 0;
            int successReason = 0;

            displayAllVisits();
            displayAllPatients();
            displayAllDoctors();

            System.out.println("Iveskite paciento ir gydytojo asmens koda, apsilankymo laika ir data:\n");

            System.out.println("Paciento asmens kodas: ");
            String akP = bufferedReader.readLine();

            System.out.println("Gydytojo asmens kodas: ");
            String akG = bufferedReader.readLine();

            System.out.println("Apsilankymo laikas: ");
            String laikas = bufferedReader.readLine();

            System.out.println("Apsilankymo data: ");
            String data = bufferedReader.readLine();

            displayAllDiseases();

            System.out.println("Iveskite apsilankymo priezasti\n");
            System.out.println("Liga: ");
            String liga = bufferedReader.readLine();

            System.out.println("Pavadinimas: ");
            String pavadinimas = bufferedReader.readLine();


            if(isValidId(akP) && isValidId(akG) && laikas.length() == 8 && isValidDate(data) && liga.length() == 5 && (pavadinimas.equals("Planinis") || pavadinimas.equals("Konsultacija"))){
                successVisit = db.queryUpdate("INSERT INTO alko8100.Apsilankymas VALUES(DEFAULT, '" + akP + "', '" + akG + "', '" + laikas + "', '" + data +"')", false);
                successReason = db.queryUpdate("INSERT INTO alko8100.Priezastis VALUES(DEFAULT, '" + liga +"', '" + pavadinimas + "')", false);

                if(successReason == 0)
                    System.out.println("Priezasties registravimas nesekmingas!");
                if(successVisit == 0)
                    System.out.println("Apsilankymo registravimas nesekmingas!");
                else
                    System.out.println("Sekmingai uzregistravote nauja apsilankyma!");
            }
            else{
                System.out.println("Netinkama duomenu ivestis!");
            }

        }
        catch (Exception ex){
            System.out.println("Klaida registruojant apsilankyma!");
            ex.printStackTrace();
        }

    }
    public void changeDoctorSalary(){
        try {
            int success = 0;
            displayAllDoctors();

            System.out.println("Iveskite gydytojo asmens koda ir nauja alga:\n");
            System.out.println("Asmens kodas: ");
            String ak = bufferedReader.readLine();

            System.out.println("Alga: ");
            String alga = bufferedReader.readLine();
            int algaParsed = Integer.parseInt(alga);

            if(isValidId(ak)){
                success = db.queryUpdate("UPDATE alko8100.Gydytojas SET Atlyginimas = " + algaParsed +"WHERE AK = '" + ak + "'", false);
                if(success == 0)
                    System.out.println("Algos atnaujinimas nesekmingas.");
                else
                    System.out.println("Sekmingai atnaujinote gydytojo alga!");
            }
            else{
                System.out.println("Netinkama duomenu ivestis!");
            }

        }
        catch (Exception ex){
            System.out.println("Klaida keiciant gydytojo alga!");
            ex.printStackTrace();
        }

    }
    public void cancelVisit(){
        LinkedList<List> result;
        try{
            int successA = 0;
            int successP = 0;

            displayAllVisits();

            System.out.println("Nurodykite apsilankymo numeri, kuri norite atsaukti:");
            String nr = bufferedReader.readLine();
            int nrParsed = Integer.parseInt(nr);

            successA = db.queryUpdate("DELETE FROM alko8100.Apsilankymas WHERE Nr = " + nrParsed, false);
            successP = db.queryUpdate("DELETE FROM alko8100.Priezastis WHERE Apsilankymas = " + nrParsed, false);

            if(successA == 0)
                System.out.println("Tokio apsilankymo neegzistuoja! Apsilankymo atsaukimas nesekmingas.");
            else
                System.out.println("Sekmingai atsaukete apsilankyma!");
        }
        catch (Exception ex){
            System.out.println("Klaida atsaukiant apsilankyma!");
            ex.printStackTrace();
        }
    }
    public void dismissDoctor(){
        try{
            LinkedList<List> result;
            int success = 0;
            displayAllDoctors();

            System.out.println("Iveskite gydytojo asmens koda:\n");
            System.out.println("Asmens kodas: ");
            String ak1 = bufferedReader.readLine();
            if(isValidId(ak1)){
                result = db.queryExecute("SELECT COUNT(*) FROM alko8100.Apsilankymas WHERE Gydytojas = '" + ak1 + "'" );

                if(!result.getFirst().get(0).toString().equals("0")){
                    result = db.queryExecute("SELECT * FROM alko8100.Gydytojas WHERE Pareigos = (SELECT Pareigos FROM alko8100.Gydytojas WHERE AK = '" + ak1 +"') AND AK NOT IN ('" + ak1 + "')" );
                    if(result.size() == 0)
                        System.out.println("Negalite atleisti gydytoja nes nera kam priskirti apsilankymus!");
                    else{
                        for (List list : result) {
                            System.out.println("Tinkami gydytojai:");
                            System.out.printf("\n%s %10s %10s %5s %10s %5s %10s %8s %10s\n\n", "AK", "|", "Vardas","|", "Pavarde","|", "Pareigos", "|", "Atlyginimas");
                            System.out.printf("%s %14s %19s %15s %13s\n", list.get(0), list.get(1), list.get(2), list.get(3), list.get(4));
                        }
                        System.out.println("\nIveskite gydytojo, kuriam priskirsite apsilankymus, asmens koda:\n");
                        String ak2 = bufferedReader.readLine();
                        if(isValidId(ak2)){
                            result = db.queryExecute("SELECT Nr FROM alko8100.Apsilankymas WHERE Gydytojas = '" + ak1 + "'" );

                            db.manageAutoCommit(false);

                            for(List list : result){
                                db.queryUpdate("UPDATE alko8100.Apsilankymas SET Gydytojas = '" + ak2 +"' WHERE Nr = " + list.get(0) , true);
                            }

                            success = db.queryUpdate("DELETE FROM alko8100.Gydytojas WHERE AK = '" + ak1 + "'", true);
                            if(success != 0){
                                db.queryCommit();
                                db.manageAutoCommit(true);
                                System.out.println("Sekmingai ateidote gydytoja!");
                            }
                            else{
                                db.queryRollback();
                                db.manageAutoCommit(true);
                                System.out.println("Nepavyko atleisti gydytoja!");
                            }

                        }
                        else{
                            System.out.println("Netinkama duomenu ivestis!");
                        }
                    }
                }
                else{
                    int success2 = 0;

                    success2 = db.queryUpdate("DELETE FROM alko8100.Gydytojas WHERE AK = '" + ak1 + "'", false);

                    if(success2 == 1)
                        System.out.println("Sekmingai ateidote gydytoja!");
                    else
                        System.out.println("Toks gydytojas neegzistuoja!");
                }
            }
            else{
                System.out.println("Netinkama duomenu ivestis!");
            }


        }
        catch(Exception ex){
            System.out.println("Klaida atleidziant gydytoja is pareigu!");
            ex.printStackTrace();
        }
    }


    private void displayAllVisits() {
        LinkedList<List> result;

        result = db.queryExecute("SELECT * FROM alko8100.Apsilankymas");
        System.out.println("Visi apsilankymai:\n");
        System.out.printf("%s %s %5s %5s %5s %5s %7s %5s %5s\n\n", "Nr", "|", "Paciento AK","|", "Gydytojo AK","|", "Laikas", "|", "Data");
        for (List list : result) {
            System.out.printf("%s %14s %17s %15s %13s\n", list.get(0), list.get(1), list.get(2), list.get(3), list.get(4));
        }
    }
    private void displayAllDoctors(){
        LinkedList<List> result;

        result = db.queryExecute("SELECT * FROM alko8100.Gydytojas");
        System.out.println("Visi gydytojai:\n");
        System.out.printf("%s %10s %10s %5s %10s %5s %10s %8s %10s\n\n", "AK", "|", "Vardas","|", "Pavarde","|", "Pareigos", "|", "Atlyginimas");
        for (List list : result) {
            System.out.printf("%s %14s %17s %18s %13s\n", list.get(0), list.get(1), list.get(2), list.get(3), list.get(4));
        }

    }
    private void displayAllDiseases(){
        LinkedList<List> result;

        result = db.queryExecute("SELECT * FROM alko8100.Liga");
        System.out.println("Visos ligos:\n");
        System.out.printf("%s %10s %10s\n\n", "Ligos nr.", "|", "Pavadinimas");
        for (List list : result) {
            System.out.printf("%s %14s\n", list.get(0), list.get(1));
        }
    }
    private void displayAllPatients(){
        LinkedList<List> result;

        result = db.queryExecute("SELECT Ak, Vardas, Pavarde FROM alko8100.Pacientas");
        System.out.println("Pacientai:");
        System.out.printf("%s %9s %15s %9s %10s\n\n", "AK", "|", "Vardas","|", "Pavarde");
        for (List list : result) {
            System.out.printf("%11s %15s %22s\n", list.get(0), list.get(1), list.get(2));
        }
    }
    public boolean isValidNameSurname(String s){
        String regex = "^[A-Za-z]\\w{0,29}$";

        Pattern p = Pattern.compile(regex);

        if (s == null) {
            return false;
        }
        Matcher m = p.matcher(s);

        return m.matches();
    }
    public boolean isValidDate(String date){
        String regex = "((?:19|20)\\d\\d)-(0?[1-9]|1[012])-([12][0-9]|3[01]|0?[1-9])";

        Pattern p = Pattern.compile(regex);
        if(date == null){
            return false;
        }
        Matcher m = p.matcher(date);

        return m.matches();
    }
    public boolean isValidId(String ak){
        String regex = "^[0-9]*$";

        Pattern p = Pattern.compile(regex);
        if(ak == null){
            return false;
        }
        Matcher m = p.matcher(ak);

        return m.matches() && ak.length() == 11;
    }
}

