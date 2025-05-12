type ENV = {
  VITE_QUEUE_API_PATH: string;
  VITE_HOSTNAME: string;
  VITE_ENV: 'development' | 'production';
};

const parseEnv = (): ENV => {
  const VITE_QUEUE_API_PATH = import.meta.env.VITE_QUEUE_API_PATH || "/api";
  const VITE_HOSTNAME = import.meta.env.VITE_HOSTNAME || "ktfwx1fl0tgaxj-8998.proxy.runpod.net";
  
  if (!VITE_QUEUE_API_PATH) {
    throw new Error("VITE_QUEUE_API_PATH is not defined");
  }
  if (!VITE_HOSTNAME) {
    throw new Error("VITE_HOSTNAME is not defined");
  }

  return {
    VITE_QUEUE_API_PATH,
    VITE_HOSTNAME,
    VITE_ENV: import.meta.env.DEV ? 'development' : 'production',
  };
};

export const env = parseEnv();
