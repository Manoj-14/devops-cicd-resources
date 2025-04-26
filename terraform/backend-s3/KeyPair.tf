resource "aws_key_pair" "dove-key" {
  key_name = "dove-key"
  // generate a key in the terminal using 'ssh-keygen -t rsa' cmd then give the name instead of default that will store in current dir
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiMDWxGFrtaccDVSt7qVaTbd1WkQwLqEk4oUInkl+ruJikD3MmZAqpdHil0OowzzxqELeNAMeQEoqbmJIOAcOl+3r1LETjhCb63adctl1x7RUhpf6kzpX9Jvofh2jX1K5AZCXOQtEqC/p7QNeDiYMWXy3V79M4O7Qh9aSCbr2euxZpOWJ7U3EqFGarr4RbMFQ6wqlffd6b0uBprgnEwuOWbFhc6KqoepXqYkFEeyAeeCWHJMIHG/6f7xbs+4ECNufZP2bCBgZKkm0PMBfHZfYTTqccm2zYUM0E2uWCGLofO0qM9OiE4U8PGjXWnlmAbg8ptqcv3vqlOmOl5w77hTyasojRrnGhRso1ZrYH62/PgSO/tMOjFquClXpcFKaPSHe1AkJMp26B8fKKSS1ZcCaRoW+9G1s5e4lZkLQu33snP9hapuKjTHc0A9VN97BXxK0MQFqAIwLfrlvkT7YTy3LjTihwjndwNikbPbpRBobsuL7bcAN/omjQXG1bndCxpqE= manom@manom-mba"
}

resource "aws_key_pair" "test-key" {
  key_name = "test-key"
  // generate a key in the terminal using 'ssh-keygen -t rsa' cmd then give the name instead of default that will store in current dir
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgRMmqyX8oWE2ZJjtF0HIZpYurbzfPeZ08XQOfKGpeT17suFidkRM7cYRTu2LyWVBNmS5A/AoddWJ+JHvwIXz+tj2wcL2JiIhUsWeukpaayRKuSuNnYSCsn6EP1sGvkA3zEeiP3KYu/1HGIZZs5a0aw6RMsLHQ92SjaTESukGaYKIqbxGwd1eE6wklHX2b1x3SmfI9I/4kvbRjjdel+Q+TPHQpgX0EC6A5O5Y41xYgU1tOB+JXBx4aD+n8ZOZXy3miiMg+z+OZQkLClWlYkSOXbXkQ003+YwRdq7c6TdZuhR+EFR0Hb6wGtQPKI9RDp0cTYxE5bL6sZOzfzOmlf2begC6vbMJk14me4Ks0dooVwfrTi5S5z0MiKEQ6Hsb9Buoz/lh9pAtWwrEtyCNjWGiglmOkOsWYMwGX/HOXXOXvuKYtzHf6gB1nFeeZJuYEDfF/UypznQgOMLj1KiYWrWmY+95fKkfyzWMzwBn8nqai42yHlF8gQoEq9bObsd4LWSE= manom@manom-mba"
}
