package hu.petrik.filmdb;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

public class RequestHandler {
    private RequestHandler(){}

    public static Response get(String url) throws IOException {
        HttpURLConnection conn = setupConnection(url);

        return getResponse(conn);
    }

    public static Response post(String url, String data) throws IOException {
        HttpURLConnection conn = setupConnection(url);

        conn.setRequestMethod("POST");
        addRequestBody(conn, data);

        return getResponse(conn);
    }

    public  static Response put(String url, String data) throws IOException {
        HttpURLConnection conn = setupConnection(url);
        conn.setRequestMethod("PUT");
        addRequestBody(conn, data);
        return getResponse(conn);
    }

    public static Response delete(String url) throws IOException {
        HttpURLConnection conn = setupConnection(url);
        conn.setRequestMethod("DELETE");
        return getResponse(conn);
    }

    private static Response getResponse(HttpURLConnection conn) throws IOException{
        int responseCode = conn.getResponseCode();
        InputStream is;
        if (responseCode < 400){
            is = conn.getInputStream();
        }else{
            is = conn.getErrorStream();
        }

        StringBuilder builder = new StringBuilder();
        BufferedReader br = new BufferedReader(new InputStreamReader(is));
        String sor = br.readLine();
        while(sor != null){
            builder.append(sor);
            sor = br.readLine();
        }
        System.out.println(builder.toString());
        br.close();
        is.close();
        conn.disconnect();

        return new Response(responseCode, builder.toString());
    }

    private static HttpURLConnection setupConnection(String url) throws IOException {
        URL urlObj = new URL(url);
        HttpURLConnection conn = (HttpURLConnection) urlObj.openConnection();
        conn.setRequestProperty("Accept", "application/json");
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(10000);

        return conn;
    }

    private static void addRequestBody(HttpURLConnection conn, String data) throws IOException{
        //a POST-hoz ezek kellenek PUT-hoz is

        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/json");
        OutputStream os = conn.getOutputStream();
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os));
        writer.write(data);
        writer.flush();
        writer.close();
        os.close();
    }
}
