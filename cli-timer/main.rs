use std::env

fn main() {
	let args: Vec<String> = env::args().collect();
	match args.len() {
		2 => {
			let work_mins: u64 = match args[1].parse() {
				Ok(mins) => mins.abs(),
				Err(_) => {
					eprintln!("[!] Error: Input must be an integer");
					return;
				}
			};
		}
		4 => {
			let work_mins: u64 = match args[1].parse() {
				Ok(mins) => mins.abs(),
				Err(_) => {
					eprintln!("[!] Error: Input must be an integer");
					return;
				}
			};

			let break_mins: u64 = match args[2].parse() {
				Ok(mins) => mins.abs(),
				Err(_) => {
					eprintln!("[!] Error: Input must be an integer");
					return;
				}
			};

			let cycles: u64 = match args[3].parse() {
				Ok(mins) => mins.abs(),
				Err(_) => {
					eprintln!("[!] Error: Input must be an integer");
					return;
				}
			};
		}
		_ => {
			eprintln!("Usage: timer <work-mins> OR timer <work-mins> <break-mins> <cycles>")
			return;
		}
	}

