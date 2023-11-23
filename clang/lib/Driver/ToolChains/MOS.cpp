#include "ToolChains/MOS.h"

using namespace clang::driver::toolchains;

MOS::MOS(const clang::driver::Driver &D, const llvm::Triple &Triple,
         const llvm::opt::ArgList &Args)
    : Generic_ELF(D, Triple, Args) {}

std::string MOS::getDynamicLinker(const llvm::opt::ArgList &Args) const {
  return "/lib/ld.so";
}
