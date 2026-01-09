/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    serverComponentsHmrCache: false, // defaults to true
  },
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "img.clerk.com",
      },
    ],
  },
  // Optimize for production
  output: "standalone", // For Docker deployments
  poweredByHeader: false, // Remove X-Powered-By header
};

export default nextConfig;
