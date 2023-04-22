async fn http_main(name: &str) -> Result<(), Box<dyn std::error::Error + Sync + Send>> {
    let mut count = 0;
    loop {
        println!("Thread {}, number: {}", name, count);
        std::thread::sleep(std::time::Duration::from_secs(1));
        count += 1;
    }
    //Ok(())
}

fn main() {
    let rt = tokio::runtime::Builder::new_multi_thread()
        //        .worker_threads(4)
        .enable_all()
        .build()
        .unwrap();
    rt.block_on(http_main("1")).unwrap();
}
